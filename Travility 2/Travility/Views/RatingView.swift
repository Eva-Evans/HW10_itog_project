//
//  RatingView.swift
//  RecipeBook
//
//  Created by Сергей Зауэрс on 31.12.2024.
//

import SwiftUI

struct RatingView: View {
    @StateObject var viewModel = RatingViewModel()
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(0..<5) { i in
                Image(systemName: i < rating ? "star.fill" : "star")
                    .onTapGesture {
                        rating = i + 1
                    }
                    .foregroundColor(i < rating ? .yellow : .secondary)
            }
        }
    }
}

#Preview {
    RatingView(rating: Binding(
        get: { 0 }, set: { _ in }
    ))
}
