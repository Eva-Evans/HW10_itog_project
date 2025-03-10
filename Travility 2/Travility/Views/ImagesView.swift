//
//  ImagesView.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI

struct ImagesView: View {
    @StateObject private var viewModel = ImagesViewModel()
    
    let imagesStrings: [String]
    let height: CGFloat
    
    var body: some View {
        if !imagesStrings.isEmpty {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<imagesStrings.count, id: \.self) { i in
                        if let image = imagesStrings[i].imageFromBase64 {
                            image
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 5)
                        }
                    }
                }
            }
            .frame(height: height)
        }
    }
}

#Preview {
    ImagesView(imagesStrings: [], height: 200)
}

