//
//  View+Extensions.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/8/21.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}
