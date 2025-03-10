//
//  PlansView.swift
//  Travility
//
//  Created by Иванова Ева on 03.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct PlansView: View {
    @StateObject private var viewModel = PlansViewModel()
    
    @FirestoreQuery private var plans: [Holiday]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
        self._plans = FirestoreQuery(
            collectionPath: "users/\(userId)/plans"
        )
    }
    
    var body: some View {
        VStack {
            List(plans) { plan in
                HolidayView(userId: userId, holiday: plan)
            }
        }
        .navigationTitle("My Plans")
    }
}

#Preview {
    PlansView(userId: "123")
}
