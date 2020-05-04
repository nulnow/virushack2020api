//
//  ProfileData.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//
import Foundation

//struct ProfileData: Codable {
//    let id: Int
//    let firstName, lastName, middleName, guid: String
//    let email, password, phone, snils: String
//    let polis, passport: String
//    let createdAt, updatedAt: String?
//}


struct ProfileData: Codable {
    let id: Int
    let firstName, lastName, middleName, guid: String
    let email, password, phone, snils: String
    let polis, passport: String
    var ills: [Ill]
}

// MARK: - Ill
struct Ill: Codable {
    let id, userID: Int
    let text, recommendations: String
    let vizits: [Vizit]

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case text, recommendations, vizits
    }
}

// MARK: - Vizit
struct Vizit: Codable {
    let id, userID, illID, hospitalID: Int
    let text: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case illID = "illId"
        case hospitalID = "hospitalId"
        case text
    }
}

