//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation
import XCTest

class SearchResponseTests : XCTestCase {
    func testDecodeRepositories() throws {
        let jsonDecoder = JSONDecoder()
        let data = SearchResponse<Repository>.exampleJSON.data(using: .utf8)!
        let response = try jsonDecoder.decode(SearchResponse<Repository>.self, from: data)
        XCTAssertEqual(response.totalCount, 218664)
        XCTAssertEqual(response.items.count, 3)
        
        let firstRepository = response.items.first
        XCTAssertEqual(firstRepository?.name, "swift")
        XCTAssertEqual(firstRepository?.fullName, "apple/swift")
    }
}
