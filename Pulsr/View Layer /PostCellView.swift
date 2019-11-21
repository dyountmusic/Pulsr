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
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("Upvotes: \(post.upvotes)")
                    Text("Comments: \(post.commentCount)")
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
        }
        .padding(.bottom)
    }
}

struct PostCellView_Previews: PreviewProvider {
    static var previews: some View {
        PostCellView(post: redditMockData[1].data)
    }
}
