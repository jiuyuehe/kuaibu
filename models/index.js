var Sequelize = require('sequelize');
var config = require('../config');
var models = module.exports = {};

var sqlLog = function (content) {
	console.log(content);
};

var sequelize = new Sequelize('dbo', config.db.username, config.db.password, {
	host: config.db.host,
	port: 33060,
	dialect: 'mysql',
	//omitNull: true,
	timezone: '+08:00',
	logging: sqlLog,
	pool: {
		max: 40,
		min: 0,
		idle: 10
	}
});

models.sequelize = sequelize;
models.Users = sequelize.import('./Users.js');
models.UserInfo = sequelize.import('./UserInfo.js');