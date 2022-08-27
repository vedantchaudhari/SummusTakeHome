//
//  PhotosService.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation
import Combine

protocol PhotosServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getAlbums(userId: String) -> AnyPublisher<[Album], Error>
    func getPhotos(albumId: String) -> AnyPublisher<[Photo], Error>
}

final class PhotosService: PhotosServiceProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getAlbums(userId: String) -> AnyPublisher<[Album], Error> {
        let endpoint = Endpoint.getAlbums(userId: userId)
        
        return networker.get(type: [Album].self, url: endpoint.url, headers: endpoint.headers)
    }
    
    func getPhotos(albumId: String) -> AnyPublisher<[Photo], Error> {
        let endpoint = Endpoint.getPhotos(albumId: albumId)
        
        return networker.get(type: [Photo].self, url: endpoint.url, headers: endpoint.headers)
    }
}
