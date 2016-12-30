/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('News', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      field: 'title',
      type: DataTypes.STRING,
      allowNull: true
    },
    titleN: {
      field: 'title_n',
      type: DataTypes.STRING,
      allowNull: true
    },
    image: {
      field: 'image',
      type: DataTypes.STRING,
      allowNull: true
    },
    content: {
      field: 'content',
      type: DataTypes.STRING,
      allowNull: true
    },
    status: {
      field: 'status',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    createTime: {
      field: 'create_time',
      type: DataTypes.DATE,
      allowNull: true
    },
    updateTime: {
      field: 'update_time',
      type: DataTypes.DATE,
      allowNull: true
    },
    newsUserid: {
      field: 'news_userid',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      references: {
        model: 'users',
        key: 'id'
      }
    }
  }, {
    tableName: 'news',
    timestamps: false,
    freezeTableName: true
  });
};
