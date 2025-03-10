//
//  EditProfileImageView.swift
//  Travility
//
//  Created by Иванова Ева on 09.02.2025.
//

import SwiftUI
import PhotosUI

struct EditProfileImageView: View {
    @StateObject private var viewModel = EditProfileImageViewModel()

    let userId: String
    @Binding var editProfileImagePresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                if let image = viewModel.image.imageFromBase64 {
                    image
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 5)
                        .clipShape(Circle())
                }
                
                PhotosPicker("Select a picture", selection: $viewModel.imagePicker, matching: .images)
                    .onChange(of: viewModel.imagePicker) {
                        Task {
                            if let loadedImage = try await viewModel.imagePicker?.loadTransferable(type: Image.self) {
                                if let imageText = loadedImage.base64 {
                                    viewModel.image = imageText
                                }
                            }
                        }
                    }
                
                TravilityButton(title: "Save", background: .green) {
                    Utils.db.collection("users").document(userId).updateData(["image": viewModel.image])
                    editProfileImagePresented = false
                }
                .padding()
                .frame(maxHeight: 80)
            }
        }
        .navigationTitle("Edit Profile Image")
    }
}

#Preview {
//    EditProfileImageView(user: .constant([]))
}
