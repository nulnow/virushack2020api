//
//  Message.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation

struct Message: Codable {
    var content: String
    var isFromUser: Bool
    var createdAt: String
}

//struct Message: Codable {
//    let id: Int
//    let content: String
//    let userID, chatID, doctorID: Int
//    let isFromUser: Bool
//    let createdAt, updatedAt: String?
//    let user: User
//    let doctor: Doctor
//}

