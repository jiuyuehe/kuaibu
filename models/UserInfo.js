/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('UserInfo', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },    
    qq: {
      field: 'qq',
      type: DataTypes.STRING,
      allowNull: true
    },
    phone: {
      field: 'phone',
      type: DataTypes.STRING,
      allowNull: true
    },
    email: {
      field: 'email',
      type: DataTypes.STRING,
      allowNull: true
    },
    address: {
      field: 'address',
      type: DataTypes.STRING,
      allowNull: true
    },
    bankName: {
      field: 'bank_name',
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
    moneyUsable: {
      field: 'money_usable',
      type: 'DOUBLE(20,0)',
      allowNull: true
    },
    moneyUnusable: {
      field: 'money_unusable',
      type: 'DOUBLE(20,0)',
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
    }
  }, {
    tableName: 'user_info',
    timestamps: false,
    freezeTableName: true
  });
};
