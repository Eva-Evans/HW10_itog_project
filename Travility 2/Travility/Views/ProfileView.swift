//
//  ProfileView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.user {
                VStack {
                    if user.image.isEmpty {
                        Image(systemName: "person.circle")
                            .resizable()
                    } else {
                        if let image = user.image.imageFromBase64 {
                            image
                                .resizable()
                                .clipShape(Circle())
                        }
                    }
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .onTapGesture {
                    viewModel.showingEditProfileImage = true
                }
                .sheet(isPresented: $viewModel.showingEditProfileImage) {
                    EditProfileImageView(userId: user.id, editProfileImagePresented: $viewModel.showingEditProfileImage)
                }
                
                profileItem(key: "Username:", value: user.username)
                profileItem(key: "Email:", value: user.email)
                profileItem(
                    key: "Member since:",
                    value: "\(Utils.formatTimeInterval(timeInterval: user.joined))"
                )

                Button("Log Out") {
                    viewModel.logOut()
                }
                .tint(.pink)
                .padding()
                
                Button("Remove Profile") {
                    viewModel.removeProfile()
                }
                .tint(.red)
                .padding()
                
                Spacer()
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
        .navigationTitle("Profile")
    }
    
    @ViewBuilder
    private func profileItem(key: String, value: String) -> some View {
        HStack {
            Text(key)
                .bold()
            
            Text(value)
                .padding(.leading)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
