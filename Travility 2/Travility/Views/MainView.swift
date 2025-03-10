//
//  MainView.swift
//  Travility
//
//  Created by Прохорова Виталия on 25.02.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        VStack {
            if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
                AccountView(userId: viewModel.currentUserId)
            } else {
                TabView {
                    LoginView()
                        .tabItem {
                            Label("Login", systemImage: "person.circle")
                        }
                    
                    RegisterView()
                        .tabItem {
                            Label("Register", systemImage: "person.badge.plus")
                        }
                }
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    MainView()
}
