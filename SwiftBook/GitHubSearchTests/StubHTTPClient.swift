//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation

class StubHTTPClient: HTTPClient {
    
    var result: Result<(Data, HTTPURLResponse), Error> = .success((Data(),
                                                                   HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))
    
    func sendRequest(_ urlRequest: URLRequest, completion: @escaping(Result<(Data, HTTPURLResponse), Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [unowned self] in
            completion(self.result)
        }
    }
    
}
