/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('MoneyOut', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    bank: {
      field: 'bank',
      type: DataTypes.STRING,
      allowNull: true
    },
    bankCard: {
      field: 'bank_card',
      type: DataTypes.STRING,
      allowNull: true
    },
    bankAddress: {
      field: 'bank_address',
      type: DataTypes.STRING,
      allowNull: true
    },
    cardName: {
      field: 'card_name',
      type: DataTypes.STRING,
      allowNull: true
    },
    moneyTotal: {
      field: 'money_total',
      type: 'DOUBLE(20,0)',
      allowNull: true
    },
    moneyUserid: {
      field: 'money_userid',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    }
  }, {
    tableName: 'money_out',
    timestamps: false,
    freezeTableName: true
  });
};
