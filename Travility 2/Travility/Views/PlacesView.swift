//
//  PlacesView.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI
import FirebaseFirestore

struct PlacesView: View {
    @StateObject private var viewModel = PlacesViewModel()
    
    @FirestoreQuery private var places: [PlaceImage]
    
    init() {
        self._places = FirestoreQuery(
            collectionPath: "places"
        )
    }

    var body: some View {
        Form {
            ForEach(Array(viewModel.placesByContinents(places: places).keys).sorted(), id: \.self) { continent in
                Section(continent) {
                    ForEach(viewModel.placesByContinents(places: places)[continent] ?? []) { placeImage in
                        ZStack {
                            ImagesView(imagesStrings: placeImage.images, height: 200)
                            Text(placeImage.country)
                                .font(.title)
                        }
                    }
                }
            }
        }
        .toolbar {
            Button {
                viewModel.showingNewPlace = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .navigationTitle("Places")
        .sheet(isPresented: $viewModel.showingNewPlace) {
            AddPlaceView(addPlacePresented: $viewModel.showingNewPlace)
        }
    }
}

#Preview {
    PlacesView()
}
