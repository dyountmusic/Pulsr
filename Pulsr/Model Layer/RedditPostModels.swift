//  RedditPostModels.swift
//  Pulsr
//
//  Created by Daniel Yount on 10/29/18.
//  Copyright © 2018 Daniel Yount. All rights reserved.
//
import Foundation

struct RedditDataWrapper: Codable {
    let kind: String
    let data: RedditData
}

struct RedditData: Codable {
    let numOfPosts: Int
    let posts: [RedditPosts]

    enum CodingKeys: String, CodingKey {
        case numOfPosts = "dist"
        case posts = "children"
    }
}

struct RedditPosts: Codable, Hashable {
    let type: String
    let data: RedditPost

    enum CodingKeys: String, CodingKey {
        case type = "kind"
        case data = "data"
    }
}

/// A model that represents user-facing attributes of a Reddit Post
/// Conforms to `Codable` and `Hashable`
struct RedditPost: Codable, Hashable {
    var title: String
    let upvotes: Int
    let url: String
    let thumbnail: String
    let commentCount: Int
    let id: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case upvotes = "ups"
        case url = "url"
        case thumbnail = "thumbnail"
        case commentCount = "num_comments"
        case id = "id"
    }
}
