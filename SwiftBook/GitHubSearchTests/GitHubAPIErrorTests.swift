//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation
import XCTest

class GitHubAPIErrorTests: XCTestCase {
    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitHubAPIError.exampleJSON.data(using: .utf8)!
        let error = try jsonDecoder.decode(GitHubAPIError.self, from: data)
        XCTAssertEqual(error.message, "Validation Failed")
    
        let firstError = error.errors.first
        XCTAssertEqual(firstError?.field, "q")
        XCTAssertEqual(firstError?.code, "missing")
        XCTAssertEqual(firstError?.resource, "Search")
    }
}
