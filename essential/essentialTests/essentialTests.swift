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
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClintSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClintSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
