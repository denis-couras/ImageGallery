//
//  UrlRequestFactory.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/9/21.
//

import Foundation

class URLRequestFactory {
    
    private let config: RequestConfig
    
    init(config: RequestConfig = RequestConfig()) {
        self.config = config
    }
    
    func baseRequest(endPoint: String) -> URLRequest? {
        
        let stringURL = "\(config.APIHost)/\(endPoint)"
        if let encodedURL = stringURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL) {
            var request = URLRequest(url: url)
            
            if let credentials = HttpUtil.getCredentials() {
                request.addValue("Client-ID \(credentials.clientId)", forHTTPHeaderField: "authorization")
                request.httpMethod = "GET"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }
        }
        
        return nil
    }
}
