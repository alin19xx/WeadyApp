//
//  Endpoint+URL.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

extension Endpoint {
    
    enum Constants {
        static let scheme: String = "http"
        static let host: String = "api.weatherapi.com"
        static let path: String = "/v1"
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = Constants.host
        components.path = Constants.path + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "key": "cab9a8950426447c8ae150442221203",
            "Content-Type": "application/json"
        ]
    }
}
