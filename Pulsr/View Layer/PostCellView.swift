//
//  PostCellView.swift
//  Pulsr
//
//  Created by Daniel Yount on 9/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import SwiftUI

struct PostCellView: View {
    
    var post: RedditPost
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                Image("bernie")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        Text("Posted by: \(post.author)")
                            .padding([.bottom, .trailing])
                            .font(.caption)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 0.1, x: 0.5, y: 0.5),
                        alignment: .bottomTrailing
                )
                HStack {
                    VStack(alignment: .leading) {
                        Text("Upvotes: \(post.upvotes)")
                        Text("Comments: \(post.commentCount)")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical)
    }
}

struct PostCellView_Previews: PreviewProvider {
    
    static let posts = mockRedditData.data.posts
    
    static var previews: some View {
        Group {
            PostCellView(post: PostCellView_Previews.posts[0].data)
            PostCellView(post: PostCellView_Previews.posts[1].data)
        }
        .previewLayout(.fixed(width: 500, height: 500))
    }
}
