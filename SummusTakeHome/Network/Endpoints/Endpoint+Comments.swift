//
//  Endpoint+Comments.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation

extension Endpoint {
    static var comments: Self {
        return Endpoint(path: "/comments")
    }
    
    static func getComments(postId: String) -> Self {
        return Endpoint(path: comments.path, queryItems: [URLQueryItem(name: "postId", value: postId)])
    }
}
