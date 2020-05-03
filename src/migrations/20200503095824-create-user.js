'use strict'
const TABLE_NAME = 'Users'
module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.createTable(TABLE_NAME, {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER,
            },
            firstName: {
                type: Sequelize.STRING,
            },
            lastName: {
                type: Sequelize.STRING,
            },
            middleName: {
                type: Sequelize.STRING,
            },
            guid: {
                type: Sequelize.STRING,
            },
            email: {
                type: Sequelize.STRING,
            },
            passport: {
                type: Sequelize.STRING,
            },
            phone: {
                type: Sequelize.STRING,
            },
            snils: {
                type: Sequelize.STRING,
            },
            polis: {
                type: Sequelize.STRING,
            },
            password: {
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