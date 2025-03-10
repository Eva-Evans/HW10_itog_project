//
//  Holiday.swift
//  Travility
//  Created by Иванова Ева on 20.02.2025.
//

import Foundation

struct Holiday: Codable, Identifiable, Hashable {
    var id: String
    var country: String
    var continent: String
    var places: [Place]
    var images: [String]
    var rating: Int
}

struct Place : Codable, Identifiable, Hashable {
    let id: String
    var city: String
    var hotel: String
    var arrival: TimeInterval
    var departure: TimeInterval
    var sights: [String]
    var price: String
    var currency: String
}
