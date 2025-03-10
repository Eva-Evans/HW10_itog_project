//
//  User.swift
//  Travility
//
//  Created by Прохорова Виталия on 20.02.2025.
//

import Foundation

struct User : Codable, Identifiable, Hashable {
    let id: String
    var username: String
    var email: String
    var joined: TimeInterval
    var image: String
}
