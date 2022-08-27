//
//  User.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Combine
import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

struct Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}

struct Geo: Codable {
    var lat: String
    var lng: String
}

struct Company: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}

extension User {
    static func mock() -> Self {
        return User(id: 1, name: "testName", username: "testUsername", email: "testEmail", address: Address(street: "testStreet", suite: "testSuite", city: "testCity", zipcode: "02067", geo: Geo(lat: "testLat", lng: "testLng")), phone: "123-456-7890", website: "testWebsite", company: Company(name: "testName", catchPhrase: "testCatchPhrase", bs: "testBs"))
    }
}
