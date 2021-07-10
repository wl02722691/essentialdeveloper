//
//  FeedLoader.swift
//  essentialdeveloper
//
//  Created by 張書涵 on 2021/7/10.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void ) 
}
