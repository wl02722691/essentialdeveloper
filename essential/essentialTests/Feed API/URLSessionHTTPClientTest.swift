//
//  URLSessionHTTPClientTest.swift
//  essentialTests
//
//  Created by Mac on 2021/10/6.
//
import XCTest
import Foundation


class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in
            
        }
    }
}


class URLSessionHTTPClientTest: XCTestCase {
    
    func test_getFromURL_createDataTaskWithURL() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        
        XCTAssertEqual(session.receiveURLs, [url])
    }
    
    // MARK: - Helpers
    // Subclass-based mocking
    private class URLSessionSpy: URLSession {
        
        var receiveURLs = [URL]()
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            receiveURLs.append(url)
            
            //先回傳假的
            return FakeURLSessionDataTask()
        }
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask {}
}
