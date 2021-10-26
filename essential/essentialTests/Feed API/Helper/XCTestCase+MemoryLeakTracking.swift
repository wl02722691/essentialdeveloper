//
//  XCTestCase+MemoryLeakTracking.swift
//  essentialTests
//
//  Created by Mac on 2021/10/26.
//

import XCTest

extension XCTestCase {

    func trackForMemoryLeak(instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "it is not nil")
        }
    }
    
    
}
