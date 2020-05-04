'use strict'

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Vizits', [
        {
      userId: 1,
      illId: 1,
      hospitalId: 1,
      text: 'Сидеть дома',
      recommendations: 'Сидеть дома',
    },
      {
      userId: 1,
      illId: 1,
      hospitalId: 1,
      text: 'Сидеть дома',
      recommendations: 'Сидеть дома',
    },
      {
        userId: 1,
        illId: 1,
        hospitalId: 3,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 3,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 1,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 6,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 6,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 11,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 12,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
      {
        userId: 1,
        illId: 1,
        hospitalId: 13,
        text: 'Сидеть дома',
        recommendations: 'Сидеть дома',
      },
    ], {})
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Vizits', null, {})
  },
}
