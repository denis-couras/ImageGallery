//
//  ServiceApi.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/9/21.
//

import Combine
import Foundation

public protocol ServiceApi {
    
    var session: URLSession { get }
    func run<T>(_ request: URLRequest, decodingType: T.Type, scheduler: DispatchQueue) -> AnyPublisher<T, Error> where T: Decodable
}

extension ServiceApi {
    
    public func run<T>(_ request: URLRequest, decodingType: T.Type, scheduler: DispatchQueue) -> AnyPublisher<T, Error> where T: Decodable {
        
        session.dataTaskPublisher(for: request)
            .subscribe(on: Schedulers.background)
            .tryMap {
                if let response = $0.response as? HTTPURLResponse, response.statusCode == 401 {
                    throw APIError.authError
                }
                
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APIError.responseUnsuccessful
                }
                
                do {
                    return try JSONDecoder().decode(T.self, from: $0.data)
                } catch let errorParsing {
                    print("Error parsing > \(errorParsing.localizedDescription)")
                    throw APIError.jsonParsingFailure
                }
            }
            .receive(on: scheduler)
            .timeout(.seconds(30), scheduler: Schedulers.main, options: nil, customError: { APIError.timeout })
            .eraseToAnyPublisher()
    }
}
