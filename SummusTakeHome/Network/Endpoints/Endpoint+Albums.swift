//
//  Endpoint+Albums.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation

extension Endpoint {
    static var albums: Self {
        return Endpoint(path: "/albums")
    }
    
    static func getAlbums(userId: String) -> Self {
        return Endpoint(path: albums.path, queryItems: [URLQueryItem(name: "userId", value: userId)])
    }
}
