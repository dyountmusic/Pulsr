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
            UpvoteCountView(post: post)
            VStack(alignment: .leading) {
                TitleView(post: post)
                PostImageView(post: post)
                CommentCountView(post: post)
            }
        }
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

struct PostImageView: View {
    let post: RedditPost
    var body: some View {
        Image("bernie")
            .resizable()
            .scaledToFit()
            .cornerRadius(10.0)
            .shadow(color: Color(.displayP3, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.3), radius: 10.0, x: 0.5, y: 1.5)
            .overlay(
                Text("Posted by: \(post.author)")
                    .padding([.bottom, .trailing])
                    .font(.caption)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 0.1, x: 0.5, y: 0.5),
                alignment: .bottomTrailing)
    }
}

struct UpvoteCountView: View {
    var post: RedditPost
    var body: some View {
        VStack {
            Image(systemName: "arrow.up")
            Text("\(post.upvotes)")
                .font(.caption)
            Image(systemName: "arrow.down")
        }
    }
}

struct TitleView: View {
    var post: RedditPost
    var body: some View {
        Text(post.title)
            .font(.headline)
            .multilineTextAlignment(.leading)
            .foregroundColor(.primary)
            .lineLimit(4)
    }
}

struct CommentCountView: View {
    var post: RedditPost
    var body: some View {
        HStack {
            Image(systemName: "ellipses.bubble")
            Text("\(post.commentCount)")
            Spacer()
        }
        .font(.caption)
        .foregroundColor(.secondary)
    }
}
