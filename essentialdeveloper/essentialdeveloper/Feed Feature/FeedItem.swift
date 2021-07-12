//
//  FeedItem.swift
//  essentialdeveloper
//
//  Created by 張書涵 on 2021/7/10.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
