'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Chats', [
            {
            userId: 1,
            doctorId: 1,
        },
          {
            userId: 1,
            doctorId: 2,
        }
        ], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Chats', null, {})
    },
}
