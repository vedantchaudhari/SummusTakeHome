//
//  ContentView.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel: PostsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: PostsRouter.destinationForTappedPost(post: post, user: viewModel.users.first { $0.id == post.userId } ?? User.mock())) {
                    VStack(alignment: .leading) {
                        Group {
                            Text(post.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.bottom)
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                Text("Author: \(viewModel.users.first { $0.id == post.userId }?.username ?? "Username Unavailable")")
                            }
                        }
                        Text(post.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                    }
                }
            }
            .navigationTitle("Posts")
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(viewModel: PostsViewModel())
    }
}
