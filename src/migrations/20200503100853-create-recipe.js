'use strict'
const TABLE_NAME = 'Recipes'
module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.createTable(TABLE_NAME, {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER,
            },
            userId: {
                type: Sequelize.INTEGER,
                // references: {
                //     model: 'User',
                //     key: 'id',
                // },
            },
            illId: {
                type: Sequelize.INTEGER,
                // references: {
                //     model: 'Ill',
                //     key: 'id',
                // },
            },
            text: {
                type: Sequelize.STRING,
            },
            recommendations: {
                type: Sequelize.STRING,
            },
            createdAt: {
                type: Sequelize.DATE,
            },
            updatedAt: {
                type: Sequelize.DATE,
            },
        })
    },
    down: (queryInterface, Sequelize) => {
        return queryInterface.dropTable(TABLE_NAME)
    },
}