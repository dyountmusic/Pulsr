//
//  RedditSubredditModels.swift
//  Pulsr
//
//  Created by Daniel Yount on 9/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation

struct SubredditDataWrapper: Codable {
    let kind: String
    let data: SubredditData
}

struct SubredditData: Codable {
    let subreddits: [Subreddits]

    enum CodingKeys: String, CodingKey {
        case subreddits = "children"
    }
}

struct Subreddits: Codable {
    let data: Subreddit
}

struct Subreddit: Codable {
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}

struct MetaRedditModel {

    public var subredditName: String? {
        get { return UserDefaults.standard.string(forKey: "SubredditName")?.capitalized }
        set {
            UserDefaults.standard.set(newValue, forKey: "SubredditName")
            redditURL = "https://www.reddit.com/r/\(String(describing: newValue))/rising.json?sort=new&raw_json=1"
        }
    }

    public var redditURL: String? {
        get { return UserDefaults.standard.string(forKey: "RedditURL") }
        set { UserDefaults.standard.set(newValue, forKey: "RedditURL") }
    }

}
