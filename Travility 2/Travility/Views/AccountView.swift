//
//  AccountView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 25.02.2025.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()

    let userId: String
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView {
                PlacesView()
            }
            .tabItem {
                Label("Places", systemImage: "photo.on.rectangle.angled")
            }
            
//            Text("Friends")
//                .tabItem {
//                    Label("Friends", systemImage: "person.3.fill")
//                }
            
//            Text("Messages")
//                .tabItem {
//                    Label("Messages", systemImage: "message")
//                }
            
            NavigationView {
                PlansView(userId: userId)
            }
            .tabItem {
                Label("My Plans", systemImage: "clock")
            }
            
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    AccountView(userId: "123")
}
