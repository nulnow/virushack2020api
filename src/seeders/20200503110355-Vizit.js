'use strict'

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Vizits', [{
      userId: 1,
      illId: 1,
      hospitalId: 1,
      text: 'Сидеть дома',
      recommendations: 'Сидеть дома',
    }, {
      userId: 1,
      illId: 1,
      hospitalId: 1,
      text: 'Сидеть дома',
      recommendations: 'Сидеть дома',
    }], {})
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Vizits', null, {})
  },
}
