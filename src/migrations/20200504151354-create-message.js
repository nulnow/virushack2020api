'use strict'
module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.createTable('Messages', {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER,
            },
            content: {
                type: Sequelize.STRING,
            },
            userId: {
                type: Sequelize.INTEGER,
            },
            chatId: {
                type: Sequelize.INTEGER,
            },
            doctorId: {
                type: Sequelize.INTEGER,
            },
            isFromUser: {
                type: Sequelize.BOOLEAN,
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
        return queryInterface.dropTable('Messages')
    },
}