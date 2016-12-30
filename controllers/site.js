var config       = require('../config');
var eventproxy   = require('eventproxy');
var cache        = require('../common/cache');
var xmlbuilder   = require('xmlbuilder');
var renderHelper = require('../common/render_helper');
var _            = require('lodash');

exports.index = function (req, res, next) {
    res.render('index', {});
};