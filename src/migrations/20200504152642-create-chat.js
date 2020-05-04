'use strict'
module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.createTable('Chats', {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER,
            },
            userId: {
                type: Sequelize.INTEGER,
            },
            doctorId: {
                type: Sequelize.INTEGER,
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
        return queryInterface.dropTable('Chats')
    },
}