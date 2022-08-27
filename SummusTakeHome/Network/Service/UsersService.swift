//
//  UsersService.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation
import Combine

protocol UsersServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getUsers() -> AnyPublisher<[User], Error>
}

final class UsersService: UsersServiceProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getUsers() -> AnyPublisher<[User], Error> {
        let endpoint = Endpoint.getUsers()
        
        return networker.get(type: [User].self, url: endpoint.url, headers: endpoint.headers)
    }
}

