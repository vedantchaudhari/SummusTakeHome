//
//  DetailedPostsViewModel.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation
import Combine

class DetailedPostsViewModel: ObservableObject {
    public let post: Post
    public let user: User

    @Published public var comments: [Comment] = [Comment]()
    
    private var commentsService: CommentsServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(post: Post, user: User, comments: [Comment] = [Comment](), commentsService: CommentsServiceProtocol = CommentsService()) {
        self.post = post
        self.user = user
        self.comments = comments
        self.commentsService = commentsService
    }
    
    func onAppear() {
        self.getComments()
    }
    
    private func getComments() {
        commentsService.getComments(postId: String(post.id))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] comments in
                self?.comments = comments
            }
            .store(in: &cancellables)
    }
}
