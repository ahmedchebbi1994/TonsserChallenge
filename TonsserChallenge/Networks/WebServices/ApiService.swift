//
//  WebServices.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit

open class ApiService {
    
    enum Constants {
        static let headerContentType = "Content-Type"
        static let headerAuthorization = "Authorization"
        static let contentTypeJson = "application/json"
        static let contentTypeUrlEncoded = "application/x-www-form-urlencoded"
    }
    
    enum RequestType {
        case get
        case post
    }
    
    enum ContentType {
        case json
        case urlencoded
    }
    
    enum Path{
        
        enum BaseUrl : String {
            case path = "https://api.tonsser.com"
            case subPath = "58/users/peter-holm/followers"
        }
        
        enum params: String {
            case currentFollowSlug = "current_follow_slug"
        }
        
        
    }
}

// MARK: - Private method
extension ApiService {
    func configureRequest(token: String? = nil, url: URL,data: Data? = nil, requestType: RequestType,contentType: ContentType? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch requestType {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
        
        request.setValue(Constants.contentTypeJson, forHTTPHeaderField: Constants.headerContentType)
        
        if let uwpToken = token {
            request.setValue("Bearer \(uwpToken)", forHTTPHeaderField: Constants.headerAuthorization)
        }
        if let data = data {
            request.httpBody = data
        }
        return request
    }
}
