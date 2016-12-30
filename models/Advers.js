/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Advers', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    adName: {
      field: 'ad_name',
      type: DataTypes.STRING,
      allowNull: true
    },
    status: {
      field: 'status',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    adGroup: {
      field: 'ad_group',
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
    adInfoid: {
      field: 'ad_infoid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'adver_info',
        key: 'id'
      }
    },
    adUserid: {
      field: 'ad_userid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    }
  }, {
    tableName: 'advers',
    timestamps: false,
    freezeTableName: true
  });
};
