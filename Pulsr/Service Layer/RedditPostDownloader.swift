//
//  RedditPostDownloader.swift
//  Pulsr
//
//  Created by Daniel Yount on 9/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import Combine

let redditMockData: [RedditPosts] = fetchMockPosts()

func fetchMockPosts() -> [RedditPosts] {
    let jsonFile = Bundle.main.url(forResource: "mock_reddit_posts", withExtension: "json")!
    let data = try! Data(contentsOf: jsonFile)
    let redditData = try! JSONDecoder().decode(RedditDataWrapper.self, from: data)
    return redditData.data.posts
}

class RedditPostDownloader {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func fetchPosts(completion: @escaping(Result<RedditData?, Error>) -> Void) {
        guard let politicsURL = URL(string: "https://www.reddit.com/r/politics.json?raw_json=1") else { return }
        session.dataTask(with: politicsURL) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(RedditDataWrapper.self, from: data)
                    completion(.success(response?.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

class RedditPostStore: ObservableObject {
     @Published private(set) var posts: [RedditPosts] = []

    private let service: RedditPostDownloader
    
    init(service: RedditPostDownloader) {
        self.service = service
    }

    func fetch() {
        service.fetchPosts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self?.posts = posts?.posts ?? []
                case .failure: self?.posts = []
                }
            }
        }
    }

}
