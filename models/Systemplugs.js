/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Systemplugs', {
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
    systemplugUserid: {
      field: 'systemplug_userid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    systemplugInfoid: {
      field: 'systemplug_infoid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'systemplug_info',
        key: 'id'
      }
    }
  }, {
    tableName: 'systemplugs',
    timestamps: false,
    freezeTableName: true
  });
};
