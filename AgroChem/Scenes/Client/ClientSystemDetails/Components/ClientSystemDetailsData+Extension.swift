//
//  ClientSystemDetailsData+Extension.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 6/5/24.
//

import Foundation

extension ClientSystemDetailsData {

    static let kukData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1pro",
                                                  name: "Протравители семян",
                                                  color: .systemPurple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Стрит, КС",
                                   subName: "Имидаклоприд, 600 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "5 - 9 л/т",
                                   color: .systemPurple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Виталон, КС",
                                   subName: "Тирам, 400 г/л + Тебуконазол, 14 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "2 л/т",
                                   color: .systemPurple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Пионер, КС",
                                   subName: "Флутриафол, 25 г/л + Тиабендазол, 25 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "2 л/т",
                                   color: .systemPurple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ger",
                                                  name: "Гербициды",
                                                  color: .systemRed),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Глифор, ВР",
                                   subName: "Глифосат (изопропиламинная соль), 360 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "2 - 5 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Дон, КЭ",
                                   subName: "С-Метолахлор, 960 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "1.3 - 1.6 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Цицерон, ВДГ",
                                   subName: "Римсульфурон, 250 г/кг",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "0.03 -0.05 кг/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Рефери, ВГР",
                                   subName: "Дикамба, 351 г/л",
                                   faza: "faza",
                                   subFaza: "3-5-й лист",
                                   norma: "norma",
                                   subNorma: "0.4 - 0.5 л/га",
                                   color: .systemRed),
        ])
    ]

    static let lenData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1pro",
                                                  name: "Протравители семян",
                                                  color: .systemPurple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Грандсил, КС",
                                   subName: "Тебуконазол, 60 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "0.4 - 0.5 л/т",
                                   color: .systemPurple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ger",
                                                  name: "Гербициды",
                                                  color: .systemRed),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Глифор, ВР",
                                   subName: "Глифосат (изопропиламинная соль), 360 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "3 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Монолит, ВДГ",
                                   subName: "Клопиралид, 750 г/кг",
                                   faza: "faza",
                                   subFaza: "фаза ёлочки",
                                   norma: "norma",
                                   subNorma: "0.09 кг/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гербикс, ВК",
                                   subName: "МЦПА, 500 г/л",
                                   faza: "faza",
                                   subFaza: "фаза ёлочки",
                                   norma: "norma",
                                   subNorma: "0.8 - 1 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гарнизон, ВР",
                                   subName: "Бентазон, 480 г/л",
                                   faza: "faza",
                                   subFaza: "фаза ёлочки",
                                   norma: "norma",
                                   subNorma: "3-4 л/га",
                                   color: .systemRed)
        ])
    ]

    static let podData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1pro",
                                                  name: "Протравители семян",
                                                  color: .systemPurple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Пионер, КС",
                                   subName: "Флутриафол, 25 г/л + Тиабендазол, 25 г/л",
                                   faza: "faza",
                                   subFaza: "обработка семян ",
                                   norma: "norma",
                                   subNorma: "2 л/т",
                                   color: .systemPurple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Стрит, КС",
                                   subName: "Имидаклоприд, 600 г/л",
                                   faza: "faza",
                                   subFaza: "обработка семян ",
                                   norma: "norma",
                                   subNorma: "8 - 12 л/т",
                                   color: .systemPurple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ger",
                                                  name: "Гербициды",
                                                  color: .systemRed),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Глифор, ВР",
                                   subName: "Глифосат (изопропиламинная соль), 360 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "3 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Дон, КЭ",
                                   subName: "С-Метолахлор, 960 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "1.3 - 1.6 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Тристар, КС",
                                   subName: "Прометрин, 500 г/л",
                                   faza: "faza",
                                   subFaza: "до всходов",
                                   norma: "norma",
                                   subNorma: "2 - 3.5 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Берилл, КЭ",
                                   subName: "Клетодим, 120 г/л",
                                   faza: "faza",
                                   subFaza: "до всходов",
                                   norma: "norma",
                                   subNorma: "0.6 - 1.8 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Мантра, ВРК",
                                   subName: "Имазамокс, 33 г/л + Имазапир, 15 г/л",
                                   faza: "faza",
                                   subFaza: "2-3 пары настоящих листьев",
                                   norma: "norma",
                                   subNorma: "1 - 1.2 л/га",
                                   color: .systemRed)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1fun",
                                                  name: "Фунгициды",
                                                  color: .purple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Азоксит, КС",
                                   subName: "Азоксистробин, 200 г/л + Тебуконазол, 160 г/л",
                                   faza: "faza",
                                   subFaza: "с 3-4 пары настоящих листьев \nпо начало цветения",
                                   norma: "norma",
                                   subNorma: "0.8 - 1 л/га",
                                   color: .purple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1des",
                                                  name: "Десиканты",
                                                  color: .orange),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Ректон, ВР",
                                   subName: "Дикват-ион, 150 г/л",
                                   faza: "faza",
                                   subFaza: "начало побурения корзинки",
                                   norma: "norma",
                                   subNorma: "2 л/га",
                                   color: .orange),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Реголон, ВР",
                                   subName: "Дикват дибромид, 150 г/л",
                                   faza: "faza",
                                   subFaza: "начало побурения корзинки",
                                   norma: "norma",
                                   subNorma: "2 л/га",
                                   color: .orange)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1min",
                                                  name: "Минеральные удобрения",
                                                  color: .systemGreen),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Олеистые",
                                   faza: "faza",
                                   subFaza: "3-4 пары настоящих листьев",
                                   norma: "norma",
                                   subNorma: "2 - 3 л/га",
                                   color: .systemGreen)
        ])
    ]

    static let rapsData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1pro",
                                                  name: "Протравители семян",
                                                  color: .systemPurple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Стрит, КС",
                                   subName: "Имидаклоприд, 600 г/л",
                                   faza: "faza",
                                   subFaza: "обработка семян ",
                                   norma: "norma",
                                   subNorma: "3 - 6 л/т",
                                   color: .systemPurple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ger",
                                                  name: "Гербициды",
                                                  color: .systemRed),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Глифор, ВР",
                                   subName: "Глифосат (изопропиламинная соль), 360 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "3 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Берилл, КЭ",
                                   subName: "Клетодим, 120 г/л",
                                   faza: "faza",
                                   subFaza: "с всходы \nпо начало цветения",
                                   norma: "norma",
                                   subNorma: "0.6-1.8 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Монолит, ВДГ",
                                   subName: "Клопиралид, 750 г/кг",
                                   faza: "faza",
                                   subFaza: "с 3-5-й лист \nпо начало бутонизации",
                                   norma: "norma",
                                   subNorma: "0.12 кг/га",
                                   color: .systemRed)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1fun",
                                                  name: "Фунгициды",
                                                  color: .purple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Бульдог, КЭ",
                                   subName: "Пропиконазол, 250 г/л",
                                   faza: "faza",
                                   subFaza: "с рост стебля \nпо формирование стручков",
                                   norma: "norma",
                                   subNorma: "0.5 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гранберг Про, КЭ",
                                   subName: "Пропиконазол, 300 г/л + Тебуконазол, 200 г/л",
                                   faza: "faza",
                                   subFaza: "с рост стебля \nпо формирование стручков",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.6 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гранберг, КЭ",
                                   subName: "Тебуконазол, 250 г/л",
                                   faza: "faza",
                                   subFaza: "формирование стручков",
                                   norma: "norma",
                                   subNorma: "0.75 - 1 л/га",
                                   color: .purple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ins",
                                                  name: "Инсектициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Норил, КЭ",
                                   subName: "Хлорпирифос, 500 г/л + Циперметрин, 50 г/л",
                                   faza: "faza",
                                   subFaza: "с всходы \nпо 3-5-й лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.6 л/га",
                                   color: .systemBlue),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Восторг, КС",
                                   subName: "Клотианидин, 140 г/л + Лямбда- цигалотрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "с всходы \nпо полное цветение",
                                   norma: "norma",
                                   subNorma: "0.1 - 0.15 л/га",
                                   color: .systemBlue),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "с семядоли \nпо полное цветение",
                                   norma: "norma",
                                   subNorma: "0.1 - 0.15 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1des",
                                                  name: "Десиканты",
                                                  color: .orange),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Ректон, ВР",
                                   subName: "Дикват-ион, 150 г/л",
                                   faza: "faza",
                                   subFaza: "созревание",
                                   norma: "norma",
                                   subNorma: "1.5 - 2 л/га",
                                   color: .orange)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1min",
                                                  name: "Минеральные удобрения",
                                                  color: .systemGreen),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Олеистые",
                                   faza: "faza",
                                   subFaza: "всходы",
                                   norma: "norma",
                                   subNorma: "2-3 л/га",
                                   color: .systemGreen),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Олеистые",
                                   faza: "faza",
                                   subFaza: "3-5-й лист",
                                   norma: "norma",
                                   subNorma: "2-3 л/га",
                                   color: .systemGreen)
        ])
    ]

    static let svekData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ger",
                                                  name: "Гербициды",
                                                  color: .systemRed),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Глифор, ВР",
                                   subName: "Глифосат (изопропиламинная соль), 360 г/л",
                                   faza: "faza",
                                   subFaza: "до посева",
                                   norma: "norma",
                                   subNorma: "2 - 5 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Бетаниум 22, КЭ",
                                   subName: "Фенмедифам, 160 г/л + Десмедифам, 160 г/л",
                                   faza: "faza",
                                   subFaza: "с семядоли по 4 настоящих листа",
                                   norma: "norma",
                                   subNorma: "1-3 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Тринити, КЭ",
                                   subName: "Этофумезат, 112 г/л + Фенмедифам, 91 г/л + Десмедифам, 71 г/л",
                                   faza: "faza",
                                   subFaza: "с семядоли по 4 настоящих листа",
                                   norma: "norma",
                                   subNorma: "1-3 л/га",
                                   color: .systemRed)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1fun",
                                                  name: "Фунгициды",
                                                  color: .purple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Кэнсел, КС",
                                   subName: "Флутриафол, 250 г/л",
                                   faza: "faza",
                                   subFaza: "с 6 настоящих листов \nпо начало смыкания междурядьев",
                                   norma: "norma",
                                   subNorma: "0.25 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Армадекс, КС",
                                   subName: "Карбендазим, 500 г/л",
                                   faza: "faza",
                                   subFaza: "с 6 настоящих листов \nпо начало смыкания междурядьев",
                                   norma: "norma",
                                   subNorma: "0.6 - 0.8 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Ципрос, КЭ",
                                   subName: "Пропиконазол, 250 г/л + Ципроконазол, 80 г/л",
                                   faza: "faza",
                                   subFaza: "с 6 настоящих листов \nпо начало смыкания междурядьев",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.75 л/га",
                                   color: .purple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "1ins",
                                                  name: "Инсектициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "c.ins",
                                   name: "Дитокс, КЭ",
                                   subName: "Диметоат, 400 г/л",
                                   faza: "faza",
                                   subFaza: "с 2 настоящих листа по начало смыкания междурядьевv",
                                   norma: "norma",
                                   subNorma: "0.5 - 1 л/га",
                                   color: .systemBlue)
        ])
    ]
}
