//
//  PostsRouter.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation
import SwiftUI

final class PostsRouter {
    
    public static func destinationForTappedPost(post: Post, user: User) -> some View {
        return DetailedPostsViewConfigurator.configureDetailedPostView(with: post, user: user)
    }
}
