//
//  Utils.swift
//  Travility
//
//  Created by Сергей Зауэрс on 21.02.2025.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class Utils {
    static let db = Firestore.firestore()
    
    static func isEmail(email: String) -> Bool {
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        return true
    }
    
    static func formatTimeInterval(timeInterval: TimeInterval) -> String {
        return Date(timeIntervalSince1970: timeInterval).formatted(date: .abbreviated, time: .shortened)
    }
    
    private static func img(title: String) -> String {
        return Image(title).base64 ?? ""
    }
    
    static let russia = Holiday(
        id: "1",
        country: "Russia",
        continent: "Europe",
        places: [
            Place(
                id: "1",
                city: "Moscow",
                hotel: "Four Seasons",
                arrival: 0,
                departure: 1,
                sights: ["The Red Square", "The Kremlin"],
                price: "1000000",
                currency: "rub"
            )
        ],
        images: [img(title: "russia1"), img(title: "russia2"), img(title: "russia3")],
        rating: 5
    )
    
    static let california = Holiday(
        id: "2",
        country: "California",
        continent: "North America",
        places: [
            Place(
                id: "2",
                city: "Los Angeles",
                hotel: "Radisson Blu",
                arrival: 0,
                departure: 1,
                sights: ["Sunset Strip", "Rainbow Bar & Grill"],
                price: "10000",
                currency: "usd"
            )
        ],
        images: [img(title: "california1"), img(title: "california2"), img(title: "california3")],
        rating: 5
    )
    
    static let australia = Holiday(
        id: "3",
        country: "Australia",
        continent: "Australia",
        places: [
            Place(
                id: "3",
                city: "Syndey",
                hotel: "Hilton",
                arrival: 0,
                departure: 1,
                sights: ["Sydney Opera House", "Royal Botanic Garden"],
                price: "20000",
                currency: "usd"
            )
        ],
        images: [img(title: "australia1"), img(title: "australia2"), img(title: "australia3")],
        rating: 5
    )
    
    static let china = Holiday(
        id: "4",
        country: "China",
        continent: "Asia",
        places: [
            Place(
                id: "4",
                city: "Beijing",
                hotel: "Jinjiang Inn",
                arrival: 0,
                departure: 1,
                sights: ["The Great Wall", "The Forbidden City"],
                price: "15000",
                currency: "usd"
            )
        ],
        images: [img(title: "china1"), img(title: "china2"), img(title: "china3")],
        rating: 5
    )
    
    static let egypt = Holiday(
        id: "5",
        country: "Egypt",
        continent: "Africa",
        places: [
            Place(
                id: "4",
                city: "Cairo",
                hotel: "",
                arrival: 0,
                departure: 1,
                sights: ["Valley of the Kings", "Pyramids of Giza"],
                price: "25000",
                currency: "usd"
            )
        ],
        images: [img(title: "egypt1"), img(title: "egypt2"), img(title: "egypt3")],
        rating: 5
    )
    
//    static let holidays: [Holiday] = [russia, california, australia, china, egypt]
}
