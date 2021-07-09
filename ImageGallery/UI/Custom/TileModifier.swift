//
//  TileModifier.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/8/21.
//

import SwiftUI

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
    }
}
