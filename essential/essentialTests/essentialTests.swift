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

class essentialTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
    // MARK - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClintSpy) {
        let client = HTTPClintSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClintSpy: HTTPClient {
        var requestedURL: URL?

        func get(from url: URL) {
            requestedURL = url
        }
    }
}
