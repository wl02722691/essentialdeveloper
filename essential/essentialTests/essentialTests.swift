//
//  essentialTests.swift
//  essentialTests
//
//  Created by 張書涵 on 2021/7/11.
//

import XCTest
@testable import essential

class RemoteFeedLoader {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClintSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class essentialTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClintSpy()
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClintSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
