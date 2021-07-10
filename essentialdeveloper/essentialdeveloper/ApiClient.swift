//
//  ApiClient.swift
//  essentialdeveloper
//
//  Created by 張書涵 on 2021/7/10.
//

import Foundation
import UIKit

// Main Module
extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {}
    func loadFeed(completion: ([FeedItem]) -> Void) {}
}

// ApiClient Module
final class ApiClient {
    static let shared = ApiClient()
    private init() {}
    func execute(_ : URLRequest, completion: (Data)-> Void) {}
}


struct LoggedInUser { }

class LoginViewController: UIViewController {
    var login: (((LoggedInUser) -> Void) -> Void)?
    
    let api = ApiClient.shared
    
    func didTapLoginButton() {
        login? { user in
            
            
        }
    }
}

struct FeedItem {  }

class FeedViewController: UIViewController {
    
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    func didTap() {
        loadFeed? { loadItem in
            
        }
    }
}
