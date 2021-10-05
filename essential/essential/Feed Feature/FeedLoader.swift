//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

public enum LoadFeedResult {
	case success([FeedItem])
	case failure(Error)
}

public protocol FeedLoader {
    associatedtype Error: Swift.Error
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
