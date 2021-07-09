//
//  ApiError.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import Foundation

public enum APIError: Error {
    
        case requestFailed
        case jsonConversionFailure
        case invalidData
        case responseUnsuccessful
        case jsonParsingFailure
        case authError
        case noData
        case unknown
        case timeout
        case urlRequestInvalid
}
