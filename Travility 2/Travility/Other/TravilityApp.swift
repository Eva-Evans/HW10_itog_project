//
//  TravilityApp.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI
import FirebaseCore

@main
struct TravilityApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
