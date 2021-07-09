//
//  HttpUtil.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/9/21.
//

import Foundation

class HttpUtil {
    
    private init() {
        
    }
    
    public static func getCredentials() -> Credentials? {
        if let path = Bundle.main.path(forResource: "CredentialsImgur", ofType: "plist"),
           let credentials = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            
            if let clientId = credentials["clientId"] as? String, !clientId.isEmpty,
               let clientSecret = credentials["clientSecret"] as? String, !clientSecret.isEmpty  {
                return .init(clientId: clientId, clientSecret: clientSecret)
            }
        }
        
        return nil
    }
}
