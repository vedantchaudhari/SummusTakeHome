//
//  DetailedPostsView.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/25/22.
//

import Foundation
import Combine
import SwiftUI

struct DetailedPostsView: View {
    @ObservedObject var viewModel: DetailedPostsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.post.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            Text(viewModel.post.body)
            HStack {
                Image(systemName: "person.crop.circle.fill")
                Text("Author: \(viewModel.user.username)")
                Spacer()
                NavigationLink(destination: AuthorRouter.destinationForTappedAuthor(user: viewModel.user)) {
                    HStack {
                        Text("View profile")
                            .font(.footnote)
                        Image(systemName: "chevron.right")
                            .font(.footnote)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
            }
            .padding()
        }
        .padding(.horizontal)
        List {
            Section(header: Text("\(viewModel.comments.count) Comments")) {
                ForEach(viewModel.comments) { comment in
                    VStack(alignment: .leading) {
                        Text(comment.name)
                            .fontWeight(.semibold)
                        Text(comment.email)
                            .padding(.bottom)
                        Text(comment.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
        Spacer()
    }
}
