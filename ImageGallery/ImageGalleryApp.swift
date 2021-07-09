//
//  ImageGalleryApp.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import SwiftUI

@main
struct ImageGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            GalleryView(vm: .init())
        }
    }
}
