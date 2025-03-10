//
//  ProfileViewModel.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025
//

import Foundation
import FirebaseAuth

class ProfileViewModel : ObservableObject {
    @Published var showingEditProfileImage: Bool = false
    @Published var user: User? = nil
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {}
    }
    
    func removeProfile() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        currentUser.delete()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.logOut()
        }
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        Utils.db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    username: data["username"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0,
                    image: data["image"] as? String ?? ""
                )
            }
        }
    }
}
