//
//  Endpoint+Photos.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation

extension Endpoint {
    static var photos: Self {
        return Endpoint(path: "/photos")
    }
    
    static func getPhotos(albumId: String) -> Self {
        return Endpoint(path: photos.path, queryItems: [URLQueryItem(name: "albumId", value: albumId)])
    }
}
