//
//  Endpoint+Users.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation

extension Endpoint {
    static var users: Self {
        return Endpoint(path: "/users")
    }
    
    static func getUsers() -> Self {
        return Endpoint(path: users.path)
    }
}
