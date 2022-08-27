//
//  DetailedAuthorViewModel.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation
import Combine

class DetailedAuthorViewModel: ObservableObject {
    public let user: User
    
    @Published public var albums: [Album] = [Album]()
    @Published public var photos: [Photo] = [Photo]()
    
    private var photosService: PhotosServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(user: User, albums: [Album] = [Album](), photos: [Photo] = [Photo](), photosService: PhotosServiceProtocol = PhotosService()) {
        self.user = user
        self.albums = albums
        self.photos = photos
        self.photosService = photosService
    }
    
    func onAppear() {
        self.getAlbums()
    }
    
    private func getAlbums() {
        photosService.getAlbums(userId: String(user.id))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] albums in
                self?.albums = albums
                self?.getPhotos()
            }
            .store(in: &cancellables)
    }
    
    private func getPhotos() {
        for album in albums {
            photosService.getPhotos(albumId: String(album.id))
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished: break
                    }
                } receiveValue: { [weak self] photos in
                    self?.photos.append(contentsOf: photos)
                }
                .store(in: &cancellables)
        }
    }
}
