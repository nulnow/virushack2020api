'use strict'

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Ills', [{
      userId: 1,
      text: 'Кашель',
      recommendations: 'Сидеть дома',
    }, {
      userId: 2,
      text: 'Кек',
      recommendations: 'Сидеть дома 2',
    }], {})
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Ills', null, {})
  },
}
