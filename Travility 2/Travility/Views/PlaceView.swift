//
//  PlaceView.swift
//  Travility
//
//  Created by Иванова Ева on 28.02.2025.
//

import SwiftUI

struct PlaceView: View {
    @StateObject private var viewModel = PlaceViewModel()
    
    @Binding var place: Place
    let removeAction: () -> Void
    
    @State var arrival: Date = Date()
    @State var departure: Date = Date()

    var body: some View {
        VStack {
            HStack {
                Text("City")
                
                TextField("Type Something", text: $place.city)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.leading, 20)
            }
            HStack {
                Text("Hotel")
                
                TextField("Type Something", text: $place.hotel)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.leading, 20)
            }
            
            DatePicker("Arrival", selection: $arrival)
                .onChange(of: arrival) { newValue in
                    place.arrival = arrival.timeIntervalSince1970
                }
            DatePicker("Departure", selection: $departure)
                .onChange(of: departure) { newValue in
                    place.departure = departure.timeIntervalSince1970
                }
            
            HStack {
                Text("Expected expenses")
                
//                Stepper(
//                    value: $place.price,
//                    in: 1...1000000000,
//                    step: 100000
//                ) {}
                
                TextField("Type Price", text: $place.price)
                    .keyboardType(.numberPad)
                
                TextField("Type Currency", text: $place.currency)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.leading, 20)
                
//                Picker(
//                    "",
//                    selection: $place.currency
//                ) {
//                    ForEach(["rub", "usd", "eur", "aed"], id: \.self) { currency in
//                        Text("\(currency)").tag(currency)
//                    }
//                }
//                .frame(maxWidth: 100)
//                .pickerStyle(.automatic)
            }
            
            List {
                Button {
                    place.sights.append("")
                } label: {
                    Label("Add Sight", systemImage: "plus")
                }
                .padding()
                
                ForEach(place.sights, id: \.self) { sight in
                    TextField("Type Sight", text: $place.sights[place.sights.firstIndex(where: { $0 == sight })!])
                }
            }
        }
        .onAppear {
            place.arrival = arrival.timeIntervalSince1970
            place.departure = departure.timeIntervalSince1970
        }
        .swipeActions {
            Button {
                removeAction()
            } label: {
                Label("Remove", systemImage: "trash")
            }
            .tint(.red)
        }
    }
}

#Preview {
//    PlaceView(place: )
}
