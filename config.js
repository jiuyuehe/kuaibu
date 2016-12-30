/**
 * config
 */

var path = require('path');
var UserRole = {
    "NORMAL_USER":0,
    "AGENT_USER_LEVEL1":1,
    "AGENT_USER_LEVEL2":2,
    "AGENT_USER_LEVEL3":3,
    "AGENT_USER_LEVEL4":4,
    "AGENT_USER_LEVEL5":5,    
    "TEAM_USER_CHILD":9,
    "TEAM_USER":10,
    "SERVICE_USER":88,
    "ADMIN_USER":99,
    "SUPER_USER":100
};

var config = {
  // debug 为 true 时，用于本地调试
  debug: false,
  //get mini_assets() { return true; }, // 是否启用静态文件的合并压缩，详见视图中的Loader

  name: '网吧增值联盟-网吧广告联盟-网吧主页联盟-快步网吧广告传媒-快步网吧联盟', 
  description: '快步网吧广告传媒增值联盟业务为网吧提供一体化的赚钱平台：网吧主页搜索,搜狗网吧增值,网吧广告,网吧云计算增值等自定义的多种形式广告增值项目为网吧增加收入！来快步没错！', // 社区的描述
  keywords: '网吧增值联盟,网吧广告联盟,云计算增值,hao123增值,搜狗网吧主页联盟,网吧联盟,网吧赚钱,搜狗网吧增值,快步网吧广告传媒',

  // 添加到 html head 中的信息
  site_headers: [
    '<meta name="author" content="subyu" />','<meta name="baidu-site-verification" content="subyu.com" />'
  ],
  site_logo: '/public/images/cnodejs_light.svg', // default is `name`
  site_icon: '/public/images/cnode_icon_32.png', // 默认没有 favicon, 这里填写网址

  //角色信息
  UserRole:UserRole,
  UserRoles:[['客户', UserRole.NORMAL_USER], ['团队子账号', UserRole.TEAM_USER_CHILD], ['团队账号', UserRole.TEAM_USER], ['客服', UserRole.SERVICE_USER], ['管理员', UserRole.ADMIN_USER], ['超级管理员', UserRole.SUPER_USER]],
  UserStatus:{
    "NORMAL_STATUS":0,
    "DISABLE_STATUS":9
  },
  CmsTabs:[
    [['user','会员管理'], ['allUser','全部账号', UserRole.AGENT_USER_LEVEL1], ['pubUser','公共账号', UserRole.ADMIN_USER], ['adUser','用户账号', UserRole.ADMIN_USER], ['cusUser','客服账号', UserRole.ADMIN_USER], ['errUser','停止账号', UserRole.ADMIN_USER], ['parUser','团队账号', UserRole.SERVICE_USER], ['childUser','团队子账号', UserRole.TEAM_USER], ['adminUser','管理账号', UserRole.ADMIN_USER], ['newUser','创建账号', UserRole.SERVICE_USER], ['modUser','修改用户', UserRole.SERVICE_USER]],
    [['system','功能'], ['iniPlug','广告配置', UserRole.SUPER_USER], ['sysPlug','插件配置', UserRole.SUPER_USER], ['ipPlug','IP配置', UserRole.SUPER_USER]],
    [['adver','广告'], ['typeAd','广告类型', UserRole.SUPER_USER], ['newAd','广告生成', UserRole.SUPER_USER], ['sureAd','广告审批', UserRole.SERVICE_USER]],
    [['money','结算'], ['checkMoney','收益查询', UserRole.SERVICE_USER], ['sureMoney','可用余额', UserRole.SERVICE_USER], ['payCtrol','提现管理', UserRole.SUPER_USER], ['liveMac','活跃终端', UserRole.SERVICE_USER], ['pushData','发布数据', UserRole.SUPER_USER]],
  ],
  //每页显示的数量
  list_users_count:30,
  // cdn host，如 http://cnodejs.qiniudn.com
  site_static_host: '', // 静态文件存储域名
  // 社区的域名
  host: 'www.kuaibu8.com',  
  // 默认的cnzz tracker ID，自有站点请修改
  cnzz_tracker_id: '',

  // mongodb 配置
  db: {
    "host": "192.168.0.26",
    "username": "root",
    "password": "yliyun123@"
  },

  // redis 配置，默认是本地
  redis_host: '192.168.0.26',
  redis_port: 6379,
  redis_db: 0,
  redis_password: 'yliyun@123',

  session_secret: 'kb_club_secret', // 务必修改
  auth_cookie_name: 'kb_club',

  // 程序运行的端口
  port: 8080,

  // 人物列表显示的人物数量
  list_count: 30,

  //管理员邮箱配置
  mail_opts: {
    host: 'smtp.163.com',
    port: 25,
    auth: {
      user: 'zhusw1117@163.com',
      pass: 'xiaoniu1117'
    },
    ignoreTLS: true,
  },

  // 超级管理员, admin 可删除话题，编辑标签。把 user_login_name 换成你的登录名
  admins: { subyu: true },
 
  // 是否允许直接注册（否则只能走 github 的方式）
  allow_sign_up: true,
  allow_sign_in: true,

  // oneapm 是个用来监控网站性能的服务
  oneapm_key: '',

  // 文件上传配置
  // 注：如果填写 qn_access，则会上传到 7牛，以下配置无效
  upload: {
    path: path.join(__dirname, 'public/upload/'),
    url: '/public/upload/'
  },

  file_limit: '1MB',
};
module.exports = config;
