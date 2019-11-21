//
//  ContentView.swift
//  Pulsr
//
//  Created by Daniel Yount on 9/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var redditStore: RedditPostStore
    
    var body: some View {
        NavigationView {
            List(redditStore.posts, id: \.data.id) { post in
                PostCellView(post: post.data)
            }
            
            .navigationBarTitle("Posts")
            .onAppear { self.redditStore.fetch() }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redditStore: .init())
    }
}
