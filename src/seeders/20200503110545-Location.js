'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Locations', [
            {
                city: 'Moscow',
                region: 'MSK Obl',
            },
            {
                city: 'Tula',
                region: 'Tula obl',
            },
        ], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Locations', null, {})
    },
}
