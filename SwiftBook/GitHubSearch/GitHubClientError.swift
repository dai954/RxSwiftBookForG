//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation

public enum GitHubClientError: Error {
    case connectionError(Error)
    
    case responseParseError(Error)
    
    case apiError(GitHubAPIError)
}
