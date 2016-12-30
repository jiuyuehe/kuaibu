/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Users', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    userRole: {
      field: 'user_role',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    userName: {
      field: 'user_name',
      type: DataTypes.STRING,
      allowNull: true
    },
    password: {
      field: 'password',
      type: DataTypes.STRING,
      allowNull: true
    },
    realName: {
      field: 'real_name',
      type: DataTypes.STRING,
      allowNull: true
    },
    status: {
      field: 'status',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    parId: {
      field: 'par_id',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    masterId: {
      field: 'master_id',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    accessToken: {
      field: 'accessToken',
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
    userinfoId: {
      field: 'userinfo_id',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'user_info',
        key: 'id'
      }
    }
  }, {
    tableName: 'users',
    timestamps: false,
    freezeTableName: true
  });
};
