/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('MoneyUser', {
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
      allowNull: false
    },
    adId: {
      field: 'ad_id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      references: {
        model: 'advers',
        key: 'id'
      }
    },
    num: {
      field: 'num',
      type: DataTypes.INTEGER(20),
      allowNull: false
    },
    adPrice: {
      field: 'ad_price',
      type: 'DOUBLE(20,0)',
      allowNull: false
    },
    money: {
      field: 'money',
      type: 'DOUBLE(20,0)',
      allowNull: true
    },
    createDate: {
      field: 'create_date',
      type: DataTypes.DATE,
      allowNull: true
    },
    updateDate: {
      field: 'update_date',
      type: DataTypes.DATE,
      allowNull: true
    },
    status: {
      field: 'status',
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
    }
  }, {
    tableName: 'money_user',
    timestamps: false,
    freezeTableName: true
  });
};
