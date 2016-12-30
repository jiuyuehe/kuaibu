/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Message', {
    id: {
      field: 'id',
      type: DataTypes.INTEGER(20),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    type: {
      field: 'type',
      type: DataTypes.STRING,
      allowNull: true
    },
    title: {
      field: 'title',
      type: DataTypes.STRING,
      allowNull: true
    },
    content: {
      field: 'content',
      type: DataTypes.STRING,
      allowNull: true
    },
    idFrom: {
      field: 'id_from',
      type: DataTypes.INTEGER(20),
      allowNull: true
    },
    idTo: {
      field: 'id_to',
      type: DataTypes.INTEGER(20),
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
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
    }
  }, {
    tableName: 'message',
    timestamps: false,
    freezeTableName: true
  });
};
