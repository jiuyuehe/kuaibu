/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('AdverInfo', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    adId: {
      field: 'ad_id',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    adName: {
      field: 'ad_name',
      type: DataTypes.STRING,
      allowNull: true
    },
    adTitle: {
      field: 'ad_title',
      type: DataTypes.STRING,
      allowNull: true
    },
    adUrl: {
      field: 'ad_url',
      type: DataTypes.STRING,
      allowNull: true
    },
    adPriceType: {
      field: 'ad_price_type',
      type: DataTypes.STRING,
      allowNull: true
    },
    adPrice: {
      field: 'ad_price',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    adPriceNum: {
      field: 'ad_price_num',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    adSettlement: {
      field: 'ad_settlement',
      type: DataTypes.STRING,
      allowNull: true
    },
    adContent: {
      field: 'ad_content',
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
    status: {
      field: 'status',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    auto: {
      field: 'auto',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    group: {
      field: 'group',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    tip: {
      field: 'tip',
      type: DataTypes.STRING,
      allowNull: true
    },
    template: {
      field: 'template',
      type: DataTypes.STRING,
      allowNull: true
    }
  }, {
    tableName: 'adver_info',
    timestamps: false,
    freezeTableName: true
  });
};
