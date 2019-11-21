//
//  PulsrTests.swift
//  PulsrTests
//
//  Created by Daniel Yount on 9/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import XCTest

class PulsrTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let data: RedditDataWrapper = LocalDataService.load("mock_reddit_posts.json")
        XCTAssert(data.data.posts.count > 0)
    }


}
