//
//  PostsService.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation
import Combine

protocol PostsServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getPosts() -> AnyPublisher<[Post], Error>
}

final class PostsService: PostsServiceProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getPosts() -> AnyPublisher<[Post], Error> {
        let endpoint = Endpoint.getPosts()
        
        return networker.get(type: [Post].self, url: endpoint.url, headers: endpoint.headers)
    }
}
