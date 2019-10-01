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
            VStack {
                Text("Hello! I have posts!").padding()
                Text("\(redditStore.posts.count) to be exact!").padding()
                Text("First Post Title: \(redditStore.posts.first?.data.title ?? "")").multilineTextAlignment(.center)
                    .padding()
            }.navigationBarTitle(Text("Posts"))
                .padding()
        }.onAppear {
            self.redditStore.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(RedditPostStore(service: .init()))
    }
}
