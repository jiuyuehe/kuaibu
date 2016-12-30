/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('UserData', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    date: {
      field: 'date',
      type: DataTypes.DATE,
      allowNull: true
    },
    wip: {
      field: 'wip',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    mac: {
      field: 'mac',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    ope: {
      field: 'ope',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    userId: {
      field: 'user_id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    adId: {
      field: 'ad_id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      references: {
        model: 'advers',
        key: 'id'
      }
    }
  }, {
    tableName: 'user_data',
    timestamps: false,
    freezeTableName: true
  });
};
