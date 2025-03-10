//
//  RegisterViewModel.swift
//  Travility
//
//  Created by Прохорова Виталия on 25.02.2025.
//

import Foundation
import FirebaseAuth

class RegisterViewModel : ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.errorMessage = "Error creating user"
                return
            }
            
            self?.insertRecord(id: userId)
        }
    }
    
    private func insertRecord(id: String) {
        let user = User(
            id: id,
            username: username,
            email: email,
            joined: Date().timeIntervalSince1970,
            image: ""
        )
        
        Utils.db.collection("users").document(id).setData(user.asDictionary())
    }
    
    func validate() -> Bool {
        errorMessage = ""

        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard Utils.isEmail(email: email) else {
            errorMessage = "Invalid email address"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long"
            return false
        }
        
        return true
    }
}
