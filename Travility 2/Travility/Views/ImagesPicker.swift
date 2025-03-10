//
//  ImagesPicker.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI
import PhotosUI

struct ImagesPicker: View {
    @StateObject private var viewModel = ImagesPickerViewModel()
    
    @Binding var images: [String]
    
    var body: some View {
        Section("Images") {
            PhotosPicker(selection: $viewModel.imagePickers, matching: .images) {
                Label("Add Images", systemImage: "plus")
            }
            .onChange(of: viewModel.imagePickers) {
                Task {
                    images.removeAll()
                    
                    for item in viewModel.imagePickers {
                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
                            if let imageText = loadedImage.base64 {
                                images.append(imageText)
                            }
                        }
                    }
                }
            }
            
            if !images.isEmpty {
                ImagesView(imagesStrings: images, height: 200)
            }
        }
    }
}

#Preview {
    ImagesPicker(images: .constant([]))
}
