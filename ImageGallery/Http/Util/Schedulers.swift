//
//  Schedulers.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/9/21.
//

import Foundation

public final class Schedulers {
    
    public init() {
        
    }
    
    public static let main = DispatchQueue.main
    public static let background = DispatchQueue.global(qos: .background)
}
