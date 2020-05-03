'use strict'

module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.bulkInsert('Users', [{
            firstName: 'John Doe',
            lastName: 'John Doe',
            middleName: 'John Doe',
            email: 'email@mail.com',
            snils: '23213213213',
            polis: '23213213213',
            passport: '123213213',
            phone: '32132323',
            guid: 'efesofesjfoesf',
            password: 'secret',
        }, {
            firstName: 'John Doe',
            lastName: 'John Doe',
            middleName: 'John Doe',
            email: 'email@mail.com',
            snils: '23213213213',
            polis: '23213213213',
            passport: '123213213',
            phone: '32132323',
            guid: 'dwadawdaw',
            password: 'secret2',
        }], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Users', null, {})
    },
}
