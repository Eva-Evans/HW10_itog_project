//
//  PlaceImage.swift
//  Travility
//
//  Created by Прохорова Виталия on 20.02.2025.
//

import Foundation

struct PlaceImage: Codable, Identifiable {
    let id: String
    var country: String
    var continent: String
    var images: [String]
}
