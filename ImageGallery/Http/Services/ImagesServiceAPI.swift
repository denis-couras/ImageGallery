//
//  ImagesServiceAPI.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import  Combine
import Foundation

public final class ImagesServiceAPI : ServiceApi {
    
    public var session: URLSession
    private var factory = URLRequestFactory()
    
    public convenience init() {
        self.init(configuration: .default)
    }
    
    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    public func getImages() -> AnyPublisher<DataResponseImgur, Error>  {
   
        guard let request = self.factory.baseRequest(endPoint: "gallery/r/cats") else {
            return Fail(outputType: DataResponseImgur.self, failure: APIError.urlRequestInvalid).eraseToAnyPublisher()
        }
        
        return run(request, decodingType: DataResponseImgur.self, scheduler: .main)
    }
}
