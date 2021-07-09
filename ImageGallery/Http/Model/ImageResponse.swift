//
//  ImageResponse.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import Foundation

public struct ImageResponse: Codable {
    
    let id: String?
    let title: String?
    let description: String?
    let datetime: Int64?
    let type: String?
    let width: Int64?
    let height: Int64?
    let views: Int64?
    let link: String?
    
}
