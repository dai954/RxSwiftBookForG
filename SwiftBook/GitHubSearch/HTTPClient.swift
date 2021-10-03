//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation

public protocol HTTPClient {
    func sendRequest(_ urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}

extension URLSession : HTTPClient {
    public func sendRequest(_ urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let task = dataTask(with: urlRequest) { data, urlResponse, error in
            switch (data, urlResponse, error) {
            case (_, _, let error?):
                completion(Result.failure(error))
            case (let data?, let urlResponse as HTTPURLResponse, _):
                completion(Result.success((data, urlResponse)))
            default:
                fatalError("invalid response combination \(String(describing: (data, urlResponse,error))).")
            }
        }
        task.resume()
    }
    
}
