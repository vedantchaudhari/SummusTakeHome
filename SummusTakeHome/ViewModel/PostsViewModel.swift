//
//  PostsViewModel.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Combine
import Foundation

class PostsViewModel: ObservableObject {
    @Published public var posts: [Post] = [Post]()
    @Published public var users: [User] = [User]()
    
    private var postsService: PostsServiceProtocol
    private var usersService: UsersServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(posts: [Post] = [Post](),
         users: [User] = [User](),
         postsService: PostsServiceProtocol = PostsService(),
         usersService: UsersServiceProtocol = UsersService()) {
        self.posts = posts
        self.users = users
        self.postsService = postsService
        self.usersService = usersService
    }
    
    public func onAppear() {
        self.getPosts()
        self.getUsers()
    }
    
    private func getPosts() {
        postsService.getPosts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
    
    private func getUsers() {
        usersService.getUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
