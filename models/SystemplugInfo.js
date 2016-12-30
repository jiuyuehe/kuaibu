/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('SystemplugInfo', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true
    },
    title: {
      field: 'title',
      type: DataTypes.STRING,
      allowNull: true
    },
    type: {
      field: 'type',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    template: {
      field: 'template',
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
    sort: {
      field: 'sort',
      type: DataTypes.INTEGER(20),
      allowNull: true
    }
  }, {
    tableName: 'systemplug_info',
    timestamps: false,
    freezeTableName: true
  });
};
