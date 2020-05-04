//
//  Metods.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation

struct Methods {
    static var login: String {
        return Endpoinds.serverUrl + "api/login"
    }
    
    static var profile: String {
        return Endpoinds.serverUrl + "api/profile"
    }
    
    static var register: String {
        return Endpoinds.serverUrl + "api/register"
    }
    
    static var vizits: String {
        return Endpoinds.serverUrl + "api/vizits"
    }
    
    static var chats: String {
        return Endpoinds.serverUrl + "api/chats"
    }
    
    static var messages: String {
        return Endpoinds.serverUrl + "api/messages"
    }
}
