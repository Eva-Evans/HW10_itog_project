//
//  HolidayView.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI
import FirebaseFirestore

struct HolidayView: View {
    @StateObject private var viewModel = HolidayViewModel()

    @FirestoreQuery private var plans: [Holiday]

    private let holiday: Holiday
    
    init(userId: String, holiday: Holiday) {
        self.holiday = holiday
        
        self._plans = FirestoreQuery(
            collectionPath: "users/\(userId)/plans"
        )
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(holiday.country)")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    if plans.contains(where: { $0.id == holiday.id }) {
                        if !holiday.places.isEmpty {
                            let arrival = Utils.formatTimeInterval(timeInterval: holiday.places.first!.arrival)
                            let departure = Utils.formatTimeInterval(timeInterval: holiday.places.last!.departure)
                            Text("\(arrival) - \(departure)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                RatingView(rating: Binding(
                    get: { holiday.rating },
                    set: { _ in }
                ))
                
                ForEach(holiday.places, id: \.self) { place in
                    HStack {
                        Text("\(place.city)\(holiday.places.last == place ? "" : ", ")")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        ForEach(place.sights, id: \.self) { sight in
                            Text("\(sight)\(holiday.places.last == place && place.sights.last == sight ? "" : ",")")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                ImagesView(imagesStrings: holiday.images, height: 100)
            }
        }
        .swipeActions() {
            if plans.contains(where: { $0.id == holiday.id }) {
                Button {
                    viewModel.removePlan(planId: holiday.id)
                } label: {
                    Label("Remove\nPlan", systemImage: "trash")
                }
                .tint(.red)
                
                Button {
                    viewModel.showingPlanHoliday.toggle()
                } label: {
                    Label("Edit\nPlan", systemImage: "pencil")
                }
                .tint(.blue)
            } else {
                Button {
                    viewModel.showingPlanHoliday.toggle()
                } label: {
                    Label("Add To\nMy Plans", systemImage: "plus")
                }
                .tint(.green)
            }
        }
        .sheet(isPresented: $viewModel.showingPlanHoliday) {
            PlanHolidayView(holiday: holiday, planHolidayPresented: $viewModel.showingPlanHoliday)
        }
    }
}

#Preview {
    HolidayView(userId: "123", holiday: Utils.russia)
}
