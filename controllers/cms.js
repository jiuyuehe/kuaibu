var eventproxy     = require('eventproxy');
var config         = require('../config');
var mail           = require('../common/mail');
var tools          = require('../common/tools');
var renderHelper   = require('../common/render_helper');
var eventproxy     = require('eventproxy');
var Users          = require('../models').Users;
var UserInfo       = require('../models').UserInfo;
var cache          = require('../common/cache');

exports.GetCmsNewUser = function (req, res, next) {
    res.render('cms/newUser',{'curTab':['newUser','创建用户账号']});
};

exports.GetCmsModUser = function (req, res, next) {
    res.render('cms/modUser',{'curTab':['modUser','修改用户信息']});
};

exports.PostCmsModUser = function (req, res, next) {
    console.log(JSON.stringify(req.body));
    res.render('cms/modUser',{'curTab':['modUser','修改用户信息']});
};

exports.users = function(req, res, next){
    var tabName = !req.params.tabName?'allUser':req.params.tabName;
    var serwd = !req.query.serwd?'':req.query.serwd;
    var page = parseInt(req.query.page, 10) || 1;
    var limit = 30;
    page = page > 0 ? page : 1;
    var userRole = req.session.user.userRole;
    var cususers = [];    

    /* 
        1、只能查看比自己权限低的人
        2、如果权限小于 等于 config.UserRole.SERVICE_USER, 也就是客服以下,只能查看自己所属的客户
    */    
    var query = {masterId:req.session.user.id}; //默认只能看自己的账号，但是客服以上的权限，可以看所有账号
    if(userRole > config.UserRole.SERVICE_USER){
        query = {};
    }
    //代理账户,或者渠道账户
    if(config.UserRoleAGENT_USER_LEVEL1<=userRole && userRole <= config.UserRoleAGENT_USER_LEVEL5){
        query.masterId = null;
        query.parId = req.session.user.id;
    }

    switch(tabName){
        case 'allUser':
            query.userRole = {lt:userRole};
            query.parId = null; //渠道账号不能查看            
            break;
        case 'pubUser':
            query = {userRole:config.UserRole.NORMAL_USER, parId:null, masterId:null};
            break;
        case 'adUser':
            query = {userRole:config.UserRole.NORMAL_USER, parId:null};
            break;
        case 'cusUser':
            query = {userRole:config.UserRole.SERVICE_USER};
            break;
        case 'errUser':
            query = {userRole:config.UserRole.NORMAL_USER, status:1};
            break;        
        case 'parUser':
            query = {userRole:{gte:config.UserRole.AGENT_USER_LEVEL1, lte:config.UserRole.AGENT_USER_LEVEL5}};
            break;
        case 'childUser':
            query = {userRole:config.UserRole.NORMAL_USER, parId:{gt:0}};
            break;
        case 'adminUser':
            query = {userRole:config.UserRole.ADMIN_USER};
            break;
    }
    console.log('query=' + JSON.stringify(query));
    var limit = config.list_users_count;
    var skip  = (page - 1) * limit;

    var ep = new eventproxy();
    ep.fail(next);

    var proxy = new eventproxy();
    proxy.fail(next);

    //客服账号
    cache.get('cususers', proxy.done(function (users){
        if (users) {
            proxy.emit('cususers', users);
        } else {
            Users.findAll({where:{userRole:config.UserRole.SERVICE_USER}}).then(function(users){
                cache.set('cususers', users, 60 * 1);
                proxy.emit('cususers', users);
            });
        }
    }));

    //页数
    Users.count({where:query}).then(function(all_users_count){
        proxy.emit('pages', Math.ceil(all_users_count / limit));
    });

    Users.findAll({field: ['id', 'userinfoId'], where:query, limit:limit, offset: skip, order: [['userRole', 'DESC'],['createTime', 'DESC']]}).then(function(users){
        //先取users, 再取 usersinfo
        console.log(users.length);
        ep.after('users', users.length, function (users) {
            proxy.emit('users', users); 
        });

        users.forEach(function (user) {
            UserInfo.findById(user.userinfoId).then(function(userInfo){
                user.userInfo  = userInfo;
                user.role =  renderHelper.UserRole(user.userRole);
                user.time = tools.formatDate(user.createTime, true); 
                ep.emit('users', user);
            });
        });
    });

    proxy.all('users', 'cususers', 'pages',
    function (users, cususers, pages) {
        return res.render('cms/users', {
            users:users, 
            cususers:cususers, 
            pages:pages,
            current_page: page,
            userRoles:config.UserRoles
        });
    });
};