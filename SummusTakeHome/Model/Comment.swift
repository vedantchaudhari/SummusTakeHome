//
//  Comment.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation

struct Comment: Codable, Identifiable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
