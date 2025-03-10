//
//  HolidayViewModel.swift
//  Travility
//
//  Created by Иванова Ева on 27.02.2025.
//

import Foundation
import FirebaseAuth

class HolidayViewModel : ObservableObject {
    @Published var showingPlanHoliday: Bool = false
    
    func removePlan(planId: String) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        Utils.db.collection("users").document(userId).collection("plans").document(planId).delete()
    }
}
