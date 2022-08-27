//
//  Endpoint.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("ERROR: Invalid URL Components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
