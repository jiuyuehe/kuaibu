/*!
 * nodeclub - route.js
 * Copyright(c) 2012 fengmk2 <fengmk2@gmail.com>
 * MIT Licensed
 */

/**
 * Module dependencies.
 */

var express = require('express');
var site = require('./controllers/site');
var sign = require('./controllers/sign');
var users = require('./controllers/user');
var cms = require('./controllers/cms');
var auth = require('./middlewares/auth');
var limit = require('./middlewares/limit');
var ccap = require('./middlewares/ccap');

var passport = require('passport');
var configMiddleware = require('./middlewares/conf');
var config = require('./config');

var router = express.Router();

router.get('/', site.index);

// 是否开放注册
if (config.allow_sign_up) {
  router.get('/signup',  sign.showSignup);  // 跳转到注册页面
  router.post('/signup', sign.signup);  // 提交注册信息
}

if(config.allow_sign_in){
  router.get('/signin', sign.showLogin);  // 进入登录页面
  router.post('/signin', sign.login);  // 登录校验
}
router.get('/signout', sign.signout);  // 登出


router.get('/reset_pass', sign.resetPass);  // 进入重置密码页面
router.post('/reset_pass', sign.updatePass);  // 更新密码

// user controller
/*router.get('/user/:name', user.index); // 用户个人主页
router.get('/setting', auth.userRequired, user.showSetting); // 用户个人设置页
router.post('/setting', auth.userRequired, user.setting); // 提交个人信息设置
router.get('/stars', user.listStars); // 显示所有达人列表页
router.get('/users/top100', user.top100);  // 显示积分前一百用户页
router.get('/user/:name/collections', user.listCollectedTopics);  // 用户收藏的所有话题页
router.get('/user/:name/topics', user.listTopics);  // 用户发布的所有话题页
router.get('/user/:name/replies', user.listReplies);  // 用户参与的所有回复页
router.post('/user/set_star', auth.adminRequired, user.toggleStar); // 把某用户设为达人
router.post('/user/cancel_star', auth.adminRequired, user.toggleStar);  // 取消某用户的达人身份
router.post('/user/:name/block', auth.adminRequired, user.block);  // 禁言某用户
router.post('/user/:name/delete_all', auth.adminRequired, user.deleteAll);  // 删除某用户所有发言
*/


router.get('/ccap', function(req, res, next){
    var ccpa = ccap.makeCapcha();
    if(req.session.ccaptext){
        console.log('之前:' + req.session.ccaptext);
    }
    req.session.ccaptext = ccpa.str;
    res.setHeader('Content-Type', 'image/bmp');
    res.end(ccpa.img.getFileData());
});

router.get('/cms/users/:tabName', auth.adminRequired, function(req,res, next){
  var tabName = !req.params.tabName?'allUser':req.params.tabName;
  var curTab = null;
  config.CmsTabs.forEach(function(pairss){
    pairss.forEach(function (pairs){
      if(pairs[0] === tabName){
        curTab = pairs;
      }
    });
  });

  switch(tabName){
    case 'newUser':
      cms.GetCmsNewUser(req, res, next);
      break;
    case 'modUser':
      cms.GetCmsModUser(req, res, next);
      break;
    default:
      res.locals.curTab = curTab;
      cms.users(req, res, next);
      break;
  }
});
router.post('/cms/newUser', auth.adminRequired, sign.signup);
router.post('/cms/modUser', auth.adminRequired, cms.PostCmsModUser);

module.exports = router;
