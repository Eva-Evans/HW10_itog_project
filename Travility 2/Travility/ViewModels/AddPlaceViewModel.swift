//
//  AddPlaceViewModel.swift
//  Travility
//
//  Created by Прохорова Виталия on 26.02.2025.
//

import Foundation

class AddPlaceViewModel : ObservableObject {
    func addPlace(place: PlaceImage) {
        Utils.db.collection("places").document(place.id).setData(place.asDictionary())
    }
}
