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
    },
      {
        "id": 3,
        "userId": 3,
        "text": "Коронавирус",
        "recommendations": "Пациент был подключен к ИВЛ в течении 5 дней, также выдавалиь антибиотики \"СТОПКОРОНАВИРУС\", а также вводилось обезболивающее в виде уколов. Была замечена высокая температура на протяжении 2ух дней, вкалывалось жаропонижающее перед сном.",
        "createdAt": null,
        "updatedAt": null
      },
      {
        "id": 4,
        "userId": 3,
        "text": "ОРЗ",
        "recommendations": "Арбидол 2 таблетки в день. Капли для носа \"Нафтизин\" перед сном.",
        "createdAt": null,
        "updatedAt": null
      },
      {
        "id": 5,
        "userId": 3,
        "text": "Конъюнктивит",
        "recommendations": "В течении 10 дней при нимать капли для глаз \"Инродоз\" и антибиотики \"Антиглазалин\".",
        "createdAt": null,
        "updatedAt": null
      },
      {
        "id": 6,
        "userId": 3,
        "text": "Инсульт",
        "recommendations": "Пациент проходил восстанавительный курс лечения, были замечены нарушения с речью, пациент был направлен к логопеду.",
        "createdAt": null,
        "updatedAt": null
      },
      {
        "id": 7,
        "userId": 3,
        "text": "Хронический гастрит",
        "recommendations": "Пациент соблюдал щадящую диету, вводился омез внутривенно 2 раза в день (курс лечения 12 дней).",
        "createdAt": null,
        "updatedAt": null
      }], {})
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Ills', null, {})
  },
}
