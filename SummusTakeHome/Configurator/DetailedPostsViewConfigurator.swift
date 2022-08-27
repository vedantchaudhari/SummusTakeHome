//
//  DetailedPostsViewConfigurator.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation

final class DetailedPostsViewConfigurator {
    
    public static func configureDetailedPostView(with post: Post, user: User) -> DetailedPostsView {
        let detailedPostView = DetailedPostsView(viewModel: DetailedPostsViewModel(post: post, user: user))
        
        return detailedPostView
    }
}
