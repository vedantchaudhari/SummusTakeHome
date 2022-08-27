//
//  Endpoint+Posts.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation

extension Endpoint {
    static var posts: Self {
        return Endpoint(path: "/posts")
    }
    
    static func getPosts() -> Self {
        return Endpoint(path: posts.path)
    }
}
