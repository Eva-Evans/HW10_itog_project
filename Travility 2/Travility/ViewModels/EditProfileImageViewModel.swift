//
//  EditProfileImageViewModel.swift
//  Travility
//
//  Created by Иванова Ева on 09.03.2025.
//

import Foundation
import SwiftUI
import PhotosUI

class EditProfileImageViewModel : ObservableObject {
    @Published var image: String = ""
    @Published var imagePicker: PhotosPickerItem?
}
