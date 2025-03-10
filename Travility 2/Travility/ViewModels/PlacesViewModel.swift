//
//  PlacesViewModel.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import Foundation

class PlacesViewModel : ObservableObject {
    @Published var showingNewPlace: Bool = false
    
    func placesByContinents(places: [PlaceImage]) -> [String : [PlaceImage]] {
        var result: [String : [PlaceImage]] = [:]
        
        places.forEach { place in
            if result.keys.contains(place.continent) {
                result[place.continent]!.append(place)
            } else {
                result[place.continent] = [place]
            }
        }
        
        return result
    }
    
//    var holidaysByContinents: [String : [Holiday]] {
//        var result: [String : [Holiday]] = [:]
//        
//        Utils.holidays.forEach { holiday in
//            if result.keys.contains(holiday.continent) {
//                result[holiday.continent]!.append(holiday)
//            } else {
//                result[holiday.continent] = [holiday]
//            }
//        }
//        
//        return result
//    }
}
