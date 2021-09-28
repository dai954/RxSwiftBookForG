//
//  URLRequest+Extensions.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation
import RxSwift

struct Resource<T> {
    let url: URL
}

extension URLRequest {

//    static func getNews<T: Decodable>(resource: Resource<T>) -> Observable<T> {
//        return Observable.just(resource.url)
//            .flatMap { url -> Observable<Data> in
//                let request = URLRequest(url: url)
//                return URLSession.shared.rx.data(request: request)
//            }.map { data in
//                return try JSONDecoder().decode(T.self, from: data)
//            }
//}
}
