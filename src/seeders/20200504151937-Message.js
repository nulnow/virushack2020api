'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Messages', [
            {
            userId: 1,
            doctorId: 1,
            chatId: 1,
            content: 'Привет!',
            isFromUser: false,
        },
          {
            userId: 1,
            doctorId: 1,
            chatId: 1,
            content: 'Привет!',
            isFromUser: true,
        },
          {
            userId: 1,
            doctorId: 2,
            chatId: 2,
            content: 'Привет!',
            isFromUser: true,
          }
        ], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Messages', null, {})
    },
}
