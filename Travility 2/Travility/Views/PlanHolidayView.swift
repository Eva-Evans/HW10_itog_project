//
//  PlanHolidayView.swift
//  Travility
//
//  Created by Иванова Ева on 28.02.2025.
//

import SwiftUI

struct PlanHolidayView: View {
    @StateObject private var viewModel = PlanHolidayViewModel()
    
    let holiday: Holiday?

    @Binding var planHolidayPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                RatingView(rating: $viewModel.holiday.rating)
                
                Form {
                    HStack {
                        Text("Country")
                        TextField("Type Country", text: $viewModel.holiday.country)
                    }
                    
                    HStack {
                        Text("Continent")
                        TextField("Type Continent", text: $viewModel.holiday.continent)
                    }
                    
                    places()
                    ImagesPicker(images: $viewModel.holiday.images)
                }
                
                Spacer()
                
                TravilityButton(title: "Plan", background: .pink) {
                    viewModel.plan(newHoliday: holiday == nil)
                    planHolidayPresented = false
                }
                .padding()
                .frame(maxHeight: 80)

            }
            .onAppear {
                viewModel.holiday = holiday ?? Holiday(
                    id: UUID().uuidString,
                    country: "",
                    continent: "",
                    places: [],
                    images: [],
                    rating: 5
                )
            }
            .navigationTitle("Plan Holiday")
        }
    }
    
    @ViewBuilder private func places() -> some View {
        Section("Places") {
            Button {
                viewModel.addPlace()
            } label: {
                Label("Add Place", systemImage: "plus")
            }
            
            ForEach(viewModel.holiday.places) { place in
                let placeNumber = viewModel.holiday.places.firstIndex(of: place)!
                
                PlaceView(place: $viewModel.holiday.places[placeNumber]) {
                    viewModel.removePlace(placeNumber: placeNumber)
                }
            }
        }
    }
    
//    @ViewBuilder
//    private func images() -> some View {
//        Section("Images") {
//            PhotosPicker(selection: $viewModel.imagePickers, matching: .images) {
//                Label("Add Images", systemImage: "plus")
//            }
//            .onChange(of: viewModel.imagePickers) {
//                Task {
//                    viewModel.holiday.images.removeAll()
//                    
//                    for item in viewModel.imagePickers {
//                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
//                            if let imageText = loadedImage.base64 {
//                                viewModel.holiday.images.append(imageText)
//                            }
//                        }
//                    }
//                }
//            }
//            
//            if !viewModel.holiday.images.isEmpty {
//                ImagesView(imagesStrings: viewModel.holiday.images, height: 200)
//            }
//        }
//    }
}

#Preview {
    PlanHolidayView(holiday: Utils.russia, planHolidayPresented: Binding(
        get: { return true },
        set: { _ in }
    ))
}
