//
//  LoginView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 25.02.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Travility",
                subtitle: "Plan your ideal trip",
                background: .blue,
                left: true
            )
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TravilityButton(title: "Login", background: .blue) {
                    viewModel.login()
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
