'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Hospitals', [{
            locationId: 1,
            title: 'fesfes',
        }, {
            locationId: 1,
            title: 'warface',
        }], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Hospitals', null, {})
    },
}
