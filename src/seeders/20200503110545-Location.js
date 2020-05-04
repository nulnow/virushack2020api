'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Locations', [
            { // 1
                city: 'Moscow',
                region: 'MSK Obl',
            },
            { // 2
                city: 'Tula',
                region: 'Tula obl',
            },
            { // 3
                city: 'SPB',
                region: 'Spb obl',
            },
            { // 3
                city: 'Novgorod',
                region: 'Novgorod obl',
            },
        ], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Locations', null, {})
    },
}
