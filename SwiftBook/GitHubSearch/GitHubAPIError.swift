//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation

public struct GitHubAPIError: Decodable, Error {
    
    public struct Error : Decodable {
        public var resource: String
        public var field: String
        public var code: String
    }
    
    public var message: String
    public var errors: [Error]
    
}
