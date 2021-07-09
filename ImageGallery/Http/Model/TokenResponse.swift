//
//  TokenResponse.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import Foundation

struct TokenResponse {
    
    let access_token: String?
    let expires_in: Int64?
    let token_type: String?
    let scope: String?
    let refresh_token: String?
    let account_id: Int64?
    let account_username: String?
    
}
