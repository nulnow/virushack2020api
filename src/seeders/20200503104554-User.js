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
        }, {
            "firstName": "Василий",
            "lastName": "Протонов",
            "middleName": "Юрьевич",
            "guid": "6f154909-78de-4106-a7f5-37e6081039aa",
            "email": "pro_toon69@yandex.ru",
            "passport": "2043 409062",
            "phone": "79017458203",
            "snils": "425-356-818 29",
            "polis": "4000532063598520",
            "password": "a0c327ab14d7ebfaf3f965075aa0f721",
            "createdAt": null,
            "updatedAt": null
        },
            {
                "firstName": "Даниил",
                "lastName": "Коратаев",
                "middleName": "Андреевич",
                "guid": "00e676fb-1174-450b-9fd3-959827432a99",
                "email": "Korot44@yandex.ru",
                "passport": "2520 993556",
                "phone": "79265522745",
                "snils": "500-600-234 69",
                "polis": "8800216504009000",
                "password": "6a0413c517339f307f2f5b947346afe3",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Аркадий",
                "lastName": "Паровозов",
                "middleName": "",
                "guid": "73f85900-66b4-4d3b-a380-983f5ea9f959",
                "email": "parovozik512@mail.ru",
                "passport": "4491 103016",
                "phone": "79037833905",
                "snils": "621-543-210 52",
                "polis": "9988307404009235",
                "password": "ffa21848c32111482d233eeae976ed45",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Даниил",
                "lastName": "Мартышкин",
                "middleName": "",
                "guid": "55359494-2313-4e25-833f-753a57f36c3f",
                "email": "bmartishka1488@yandex.ru",
                "passport": "96320 201047",
                "phone": "79262562563",
                "snils": "288-550-007 30",
                "polis": "6076131054915479",
                "password": "7deb90af2d05f84e40dcba1220d99308",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Владимир",
                "lastName": "Поехавший",
                "middleName": "",
                "guid": "049e4716-9822-48ed-8c60-ae6fc87bcb56",
                "email": "Poehal512@mail.ru",
                "passport": "1619 892456",
                "phone": "79260725324",
                "snils": "445-500-244 54",
                "polis": "8800216504008991",
                "password": "0d5ebd9284e2c3dfa5bedee92045bb2b",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Паша",
                "lastName": "Бумчек",
                "middleName": "Геннадьевич",
                "guid": "a5c9e3bc-cc3c-4e48-9be5-145e4b1d65a9",
                "email": "pasha_b00mchick@hotmail.com",
                "passport": "2941 458741",
                "phone": "79055632015",
                "snils": "534-982-366 12",
                "polis": "4000635469872133",
                "password": "709b571c9d00fba69e6d72dcbf994abb",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Анатолий",
                "lastName": "Власов",
                "middleName": "Юрьевич",
                "guid": "57f083dd-c7f9-4194-ba75-a3acd6760d1c",
                "email": "Vlasov512@mail.ru",
                "passport": "1012 441002",
                "phone": "79257862144",
                "snils": "308-506-217 45",
                "polis": "7801215476447901",
                "password": "3db051c6368bc33a31f7759fff717408",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Никита",
                "lastName": "Буерак",
                "middleName": "Ильич",
                "guid": "dffd9d6a-a125-453c-ab51-c6be6c93a7ed",
                "email": "byer0ck@mail.ru",
                "passport": "3047 509064",
                "phone": "79156327410",
                "snils": "125-452-676 30",
                "polis": "4000774236850022",
                "password": "2c18e1d4d7a2bd3bb9732533bbb57f2c",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Василий",
                "lastName": "Протонов",
                "middleName": "Юрьевич",
                "guid": "6f154909-78de-4106-a7f5-37e6081039aa",
                "email": "pro_toon69@yandex.ru",
                "passport": "2043 409062",
                "phone": "79017458203",
                "snils": "425-356-818 29",
                "polis": "4000532063598520",
                "password": "a0c327ab14d7ebfaf3f965075aa0f721",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Платон",
                "lastName": "Шугейз",
                "middleName": "Даниилович",
                "guid": "b6fd502d-e3b2-4a19-b865-75a9efa16500",
                "email": "plato99@mail.ru",
                "passport": "4421 659187",
                "phone": "79078203698",
                "snils": "365-856-911 78",
                "polis": "4003501798123321",
                "password": "7ed338aff0715a57e61e19dc6f20fca4",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Иван",
                "lastName": "Зизюля",
                "middleName": "Ильич",
                "guid": "2946d1ed-525d-4c3a-bb0d-dfeeea6a822d",
                "email": "ivan_ziz99@mail.ru",
                "passport": "2601 578362",
                "phone": "79250125888",
                "snils": "345-212-012 25",
                "polis": "4002236912470236",
                "password": "535dce40eec99b43ae72397b148821c5",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Аркадий",
                "lastName": "Марков",
                "middleName": "Игнатьевич",
                "guid": "1fe137eb-c5a1-46c6-b58f-58ce58e666ce",
                "email": "imark53@yandex.ru",
                "passport": "4311 661390",
                "phone": "79135210368",
                "snils": "215-233-715 14",
                "polis": "4001234156125632",
                "password": "4fb2eadc28a2eb83c78fe72e352f7523",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Иван",
                "lastName": "Иванов",
                "middleName": "Иванович",
                "guid": "2f11284e-94ed-43c0-a3c5-605822f106cf",
                "email": "iavnov1cj34@gmail.com",
                "passport": "6681 127785",
                "phone": "77891235478",
                "snils": "616-230-902 17",
                "polis": "4000158736857520",
                "password": "7bb4623f014262163eae1c079963bce0",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Александр",
                "lastName": "Шпак",
                "middleName": "Антон-Чехов",
                "guid": "aeef0043-6585-40f4-b69a-61c10570eca0",
                "email": "shpackman512@yandex.ru",
                "passport": "4615 668562",
                "phone": "79034127863",
                "snils": "487-601-925 44",
                "polis": "4000653285691234",
                "password": "963ae9e781c1d205fbbbf16f7e1c1b45",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Ольга",
                "lastName": "Крымова",
                "middleName": "Анатольевна",
                "guid": "144ec82c-f7b6-4a75-87a7-709ea2eebc71",
                "email": "krimova77@mail.ru",
                "passport": "2034 801012",
                "phone": "79034127863",
                "snils": "621-238-019 77",
                "polis": "4000532045203256",
                "password": "496ddbfc9deb14d67c3df01a50452b2e",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Алиса",
                "lastName": "Овалова",
                "middleName": "Викторовна",
                "guid": "267de6ed-10b9-4d7e-a380-00265504f0c3",
                "email": "noobia_master44@gmail.com",
                "passport": "2043 553201",
                "phone": "79078541002",
                "snils": "698-256-120 98",
                "polis": "2000362063598520",
                "password": "82afda4241469f120e8f326e6601b601",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Ирина",
                "lastName": "Богомолова",
                "middleName": "Никитична",
                "guid": "ccba84b7-317b-4483-9270-9ebf309e8869",
                "email": "bogogo908@yandex.ru",
                "passport": "5043 963201",
                "phone": "79063001476",
                "snils": "351-244-012 34",
                "polis": "200036203598520",
                "password": "123cb3611f7ed5c0fb3c3ce89f63f689",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Любовь",
                "lastName": "Попова",
                "middleName": "Олеговна",
                "guid": "9d12dd66-717b-485c-a3c4-b79d4ea40753",
                "email": "popovarova@mail.ru",
                "passport": "1043 745822",
                "phone": "79154420987",
                "snils": "321-782-368 45",
                "polis": "200036209998520",
                "password": "bb560596e4b3b26277d23efe0624ea87",
                "createdAt": null,
                "updatedAt": null
            },
            {
                "firstName": "Анастасия",
                "lastName": "Модоворова",
                "middleName": "Евангельевна",
                "guid": "77cbf800-42c8-4a90-9376-8fc755c0cf73",
                "email": "evangelion1822@yandex.ru",
                "passport": "2043 593462",
                "phone": "79775203695",
                "snils": "425-356-818 29",
                "polis": "200036209956230",
                "password": "b58e9c74f51f8b8772cc041cf1030f68",
                "createdAt": null,
                "updatedAt": null
            }], {})
    },

    down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Users', null, {})
    },
}
