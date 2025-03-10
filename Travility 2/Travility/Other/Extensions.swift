//
//  Extensions.swift
//  Travility
//
//  Created by Прохорова Виталия on 20.02.2025.
//

import Foundation
import SwiftUI

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension View {
    func toUIImage() -> UIImage? {
        let renderer = ImageRenderer(content: self)
        renderer.scale = 0.5
        return renderer.uiImage
    }
}

extension Image {
    func imageSize(size: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }
    
    var base64: String? {
        guard let image = self.toUIImage() else {
            return nil
        }
        
        return image.base64
    }
}

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 0.5)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: Image? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        
        guard let uiImage = UIImage(data: imageData) else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
}
