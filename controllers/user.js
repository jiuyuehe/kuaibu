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

