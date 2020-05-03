'use strict'
const TABLE_NAME = 'Hospitals'
module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.createTable(TABLE_NAME, {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER,
            },
            locationId: {
                type: Sequelize.INTEGER,
                // references: {
                //     model: 'Hospital',
                //     key: 'id',
                // },
            },
            title: {
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