/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Ipplugs', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true
    },
    status: {
      field: 'status',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    content: {
      field: 'content',
      type: DataTypes.STRING,
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
    ipplugUserid: {
      field: 'ipplug_userid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    ipplugAdid: {
      field: 'ipplug_adid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'advers',
        key: 'id'
      }
    }
  }, {
    tableName: 'ipplugs',
    timestamps: false,
    freezeTableName: true
  });
};
