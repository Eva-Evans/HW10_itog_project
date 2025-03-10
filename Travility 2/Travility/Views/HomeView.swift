//
//  HomeView.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    @FirestoreQuery private var holidays: [Holiday]
    
    init() {
        self._holidays = FirestoreQuery(
            collectionPath: "holidays"
        )
    }

    var body: some View {
        VStack {
            Form {
                Section("Nice planned holidays") {
                    List(holidays) { holiday in
                        HolidayView(userId: "123", holiday: holiday)
                    }
                }
                
                Section("Select your destination") {
                    List {
                        continent(name: "South America")
                        continent(name: "North America")
                        continent(name: "Africa")
                        continent(name: "Europe")
                        continent(name: "Asia")
                        continent(name: "Australia")
                        continent(name: "Antarctica")
                    }
                }
            }
        }
        .toolbar {
            Button {
                viewModel.showingNewHoliday = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $viewModel.showingNewHoliday) {
            PlanHolidayView(holiday: nil, planHolidayPresented: $viewModel.showingNewHoliday)
        }
        .navigationTitle("Home")
    }
    
    @ViewBuilder
    private func continent(name: String) -> some View {
        NavigationLink(name) {
            List(holidays) { holiday in
                if holiday.continent == name {
                    HolidayView(userId: "123", holiday: holiday)
                }
            }
            .navigationTitle(name)
        }
    }
}

#Preview {
    HomeView()
}
