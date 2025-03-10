//
//  ImagesPickerViewModel.swift
//  Travility
//
//  Created by Иванова Ева on 09.03.2025.
//

import Foundation
import SwiftUI
import PhotosUI

class ImagesPickerViewModel : ObservableObject {
    @Published var imagePickers = [PhotosPickerItem]()
}
