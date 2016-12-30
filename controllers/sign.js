
var validator      = require('validator');
var eventproxy     = require('eventproxy');
var config         = require('../config');
var Users          = require('../models').Users;
var UserInfo          = require('../models').UserInfo;
var mail           = require('../common/mail');
var tools          = require('../common/tools');
var utility        = require('utility');
var authMiddleWare = require('../middlewares/auth');
var uuid           = require('node-uuid');

//sign up
exports.showSignup = function (req, res) {
  res.render('sign/signup');
};

exports.signup = function(req, res, next){
    var userInfo = {
        id:undefined,        
        phone:validator.trim(req.body.phone),
        qq:validator.trim(req.body.qq),
        email:validator.trim(req.body.email).toLowerCase(),
        address:validator.trim(req.body.address),
        bankName:validator.trim(req.body.bank),
        bankCard:validator.trim(req.body.bankcard),
        bankAddress:validator.trim(req.body.bankadress),
        cardName:validator.trim(req.body.cardname),
        moneyUsable:0,
        moneyUnusable:0,
        createTime: new Date().getTime(),
        updateTime: new Date().getTime()
    }
    var user = {
        id: undefined,
        userRole: config.UserRole.NORMAL_USER,
        userName: validator.trim(req.body.username).toLowerCase(),
        password: validator.trim(req.body.password),
        realName:validator.trim(req.body.name),
        status: config.UserStatus.NORMAL_STATUS,
        masterId: 27, //后期记得修改
        parId:undefined,
        userinfoId:undefined,
        createTime: new Date().getTime(),
        updateTime: new Date().getTime()
    };

    var path = req.path.substr(1);
    tools.bhash(user.password, function (err, passhash) {
        console.log(err);
        console.log(passhash);
        user.password = passhash;

         Users.findOne({where: {userName: user.userName}}).then(function(row) {
            if (!!row) {
                return res.render(path,{'curTab':['newUser','创建用户账号'], 'error':'用户名已经存在!', user:user, userInfo:userInfo});
            }
            
            //var userObj = Users.create(user);
            var userInfoObj = UserInfo.create(userInfo).then(function(row){
                if (!!row) {
                    user.userinfoId = row.id;
                    Users.create(user).then(function(row_){
                        if(path.indexOf('cms')>=-1){
                            return res.render('cms/users', {'curTab':['allUser','全部账号']});        
                        }else{
                            return res.render('login');
                        }
                    });
                }else{
                    return res.render(path,{'curTab':['newUser','创建用户账号'], 'error':'用户创建失败!', user:user, userInfo:userInfo});;
                }
            });
        });
    });
}

/**
 * Show user login page.
 *
 * @param  {HttpRequest} req
 * @param  {HttpResponse} res
 */
exports.showLogin = function (req, res) {
  console.log('showLogin....................');
  req.session._loginReferer = req.headers.referer;
  res.render('sign/signin');
};

/**
 * define some page when login just jump to the home page
 * @type {Array}
 */
var notJump = [
  '/active_account', //active page
  '/reset_pass',     //reset password page, avoid to reset twice
  '/signup',         //regist page
  '/search_pass'    //serch pass page
];

/**
 * Handle user login.
 *
 * @param {HttpRequest} req
 * @param {HttpResponse} res
 * @param {Function} next
 */
exports.login = function (req, res, next) {
  var username = validator.trim(req.body.username).toLowerCase();
  var pass      = validator.trim(req.body.password);
  var ep        = new eventproxy();

  ep.fail(next);

  if (!username || !pass) {
    res.status(422);
    return res.render('sign/signin', { error: '信息不完整。' });
  }
  ep.on('login_error', function (login_error) {
    res.status(403);
    res.render('sign/signin', { error: '用户名或密码错误' });
  });

  Users.findOne({where: {userName: username}}).then(function(user) {
      var passhash = user.password;
      tools.bcompare(pass, passhash, ep.done(function (bool) {
        if (!bool) {
          return ep.emit('login_error');
        }
        // store session cookie
        authMiddleWare.gen_session(user, res);
        //check at some page just jump to home page
        var refer = req.session._loginReferer || '/';
        for (var i = 0, len = notJump.length; i !== len; ++i) {
          if (refer.indexOf(notJump[i]) >= 0) {
            refer = '/';
            break;
          }
        }
        console.log('refer refer refer=' + refer);
        if(refer === '/'){
            if(user.userRole >= config.UserRole.SERVICE_USER){
                refer = '/cms';
            }else{
                refer = '/user/' + user.userName;
            }
        }
        console.log('redirect refer refer=' + refer);
        res.redirect(refer);
      }));
  });
};

// sign out
exports.signout = function (req, res, next) {
  req.session.destroy();
  res.clearCookie(config.auth_cookie_name, { path: '/' });
  res.redirect('/');
};

/**
 * reset password
 * 'get' to show the page, 'post' to reset password
 * after reset password, retrieve_key&time will be destroy
 * @param  {http.req}   req
 * @param  {http.res}   res
 * @param  {Function} next
 */
exports.resetPass = function (req, res, next) {
  var key  = validator.trim(req.query.key || '');
  var name = validator.trim(req.query.name || '');

  User.getUserByNameAndKey(name, key, function (err, user) {
    if (!user) {
      res.status(403);
      return res.render('notify/notify', {error: '信息有误，密码无法重置。'});
    }
    var now = new Date().getTime();
    var oneDay = 1000 * 60 * 60 * 24;
    if (!user.retrieve_time || now - user.retrieve_time > oneDay) {
      res.status(403);
      return res.render('notify/notify', {error: '该链接已过期，请重新申请。'});
    }
    return res.render('sign/reset', {name: name, key: key});
  });
};

exports.updatePass = function (req, res, next) {
  var psw   = validator.trim(req.body.psw) || '';
  var repsw = validator.trim(req.body.repsw) || '';
  var key   = validator.trim(req.body.key) || '';
  var name  = validator.trim(req.body.name) || '';

  var ep = new eventproxy();
  ep.fail(next);

  if (psw !== repsw) {
    return res.render('sign/reset', {name: name, key: key, error: '两次密码输入不一致。'});
  }
  User.getUserByNameAndKey(name, key, ep.done(function (user) {
    if (!user) {
      return res.render('notify/notify', {error: '错误的激活链接'});
    }
    tools.bhash(psw, ep.done(function (passhash) {
      user.pass          = passhash;
      user.retrieve_key  = null;
      user.retrieve_time = null;
      user.active        = true; // 用户激活

      user.save(function (err) {
        if (err) {
          return next(err);
        }
        return res.render('notify/notify', {success: '你的密码已重置。'});
      });
    }));
  }));
};