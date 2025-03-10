//
//  AddPlaceView.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI

struct AddPlaceView: View {
    @StateObject private var viewModel = AddPlaceViewModel()
    
    @State private var place: PlaceImage = PlaceImage(
        id: UUID().uuidString,
        country: "",
        continent: "Europe",
        images: []
    )
    
    @Binding var addPlacePresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        Text("Country")
                        TextField("Type Country", text: $place.country)
                        Picker(
                            "",
                            selection: $place.continent
                        ) {
                            let arr = ["Asia", "Europe", "Africa", "North America", "South America", "Antarctica", "Australia"]
                            
                            ForEach(arr, id: \.self) { i in
                                Text("\(i)").tag(i)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                    ImagesPicker(images: $place.images)
                }
                
                TravilityButton(title: "Save", background: .green) {
                    viewModel.addPlace(place: place)
                    addPlacePresented = false
                }
                .padding()
                .frame(maxHeight: 80)
            }
            .navigationTitle("Add Place")
        }
    }
}

#Preview {
    AddPlaceView(addPlacePresented: Binding(
        get: { return true },
        set: { _ in }
    ))
}
