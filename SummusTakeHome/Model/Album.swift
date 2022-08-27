//
//  Album.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation

struct Album: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
}
