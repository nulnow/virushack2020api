//
//  ChatData.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation

//
//struct ChatData {
//    var avatarIamge: String?
//    var title: String
//    var lastMessage: String
//    var status: ChatStatus
//}
//
//
//struct Doctor: Codable {
//    var name: String
//}
//
//struct ChatInfo: Codable {
//    var id: Int
//    var doctor: Doctor
//    var lastMessage: String
//}


struct ChatInfo: Codable {
    let id, userID, doctorID: Int
    let createdAt, updatedAt: String?
    let user: User
    let doctor: Doctor

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case doctorID = "doctorId"
        case createdAt, updatedAt, user, doctor
    }
}

// MARK: - Doctor
struct Doctor: Codable {
    let id: Int
    let name: String
    let createdAt, updatedAt: String?
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName, lastName, middleName, guid: String
    let email, password, phone, snils: String
    let polis, passport: String
    let createdAt, updatedAt: String?
}
