//
//  Preparable.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation

protocol Preparable {
    var isPrepared :Bool { get }
    func prepare()
}
