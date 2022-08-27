//
//  CommentsService.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation
import Combine

protocol CommentsServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getComments(postId: String) -> AnyPublisher<[Comment], Error>
}

final class CommentsService: CommentsServiceProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getComments(postId: String) -> AnyPublisher<[Comment], Error> {
        let endpoint = Endpoint.getComments(postId: postId)
        
        return networker.get(type: [Comment].self, url: endpoint.url, headers: endpoint.headers)
    }
}
