'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Hospitals', [

            { // 1
            locationId: 1,
            title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
        }, { // 2
            locationId: 1,
            title: 'ГКБ № 13',
        },
            { // 3
                locationId: 1,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { // 4
                locationId: 1,
                title: 'ГКБ № 13',
            },
            { // 5
                locationId: 2,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { // 6
                locationId: 2,
                title: 'ГКБ № 13',
            },
            { // 7
                locationId: 2,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { // 8
                locationId: 2,
                title: 'ГКБ № 13',
            },
            { // 9
                locationId: 2,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            },
            { // 10
                locationId: 2,
                title: 'ГКБ № 13',
            },
            { // 11
                locationId: 3,
                title: 'Больница 1',
            },
            { // 12
                locationId: 3,
                title: 'Больница 2',
            },
            { // 13
                locationId: 3,
                title: 'Больница 3',
            },
            { // 14
                locationId: 1,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { // 15
                locationId: 1,
                title: 'ГКБ № 13',
            },
            { // 16
                locationId: 3,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { //17
                locationId: 3,
                title: 'ГКБ № 13',
            },
            { // 18
                locationId: 3,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { // 19
                locationId: 3,
                title: 'ГКБ № 13',
            },
            { // 20
                locationId: 3,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { //21
                locationId: 1,
                title: 'ГКБ № 13',
            },
            { // 22
                locationId: 1,
                title: 'ГОРОДСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА № 17',
            }, { // 23
                locationId: 1,
                title: 'ГКБ № 13',
            },
        ], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Hospitals', null, {})
    },
}
