//
//  HeaderView.swift
//  Travility
//
//  Created by Сергей Зауэрс on 26.02.2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    let left: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 5, height: 450)
                .rotationEffect(Angle(degrees: left ? -40 : 40))
                .offset(x: left ? -300 : 300)
                .foregroundColor(background)
                
//                Circle()
//                    .frame(width: screenSize.width * 1.5, height: screenSize.width * 1.5)
//                    .offset(x: -screenSize.width / 2.2, y: -screenSize.height / 3)
//                    .foregroundColor(Color(UIColor.systemIndigo))
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                    .bold()
                
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            .offset(x: left ? -70 : 70, y: -120)
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", background: .blue, left: true)
}
