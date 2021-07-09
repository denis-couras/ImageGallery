//
//  GalleryResponse.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import Foundation

public struct DataResponseImgur: Codable {
    let data: [ImageResponse]?
    let success: Bool?
    let status: Int?
}
