//
//  TravilityButton.swift
//  Travility
//
//  Created by Иванова Ева on 26.02.2025.
//

import SwiftUI

struct TravilityButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TravilityButton(
        title: "Title",
        background: .accentColor
    ) {}
}
