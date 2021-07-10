//
//  essentialTests.swift
//  essentialTests
//
//  Created by 張書涵 on 2021/7/11.
//

import XCTest
@testable import essential

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL) {
        requestURL = url
    }
    
    var requestURL: URL?
}

class HTTPClintSpy: HTTPClient {
    override func get(from url: URL) {
        requestURL = url
    }
}

class essentialTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClintSpy.shared
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClintSpy.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
    }
}
