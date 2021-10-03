//
//  Extensions.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation

extension Collection where Element == String {
    var sum: String {
        return reduce("") { return $0 + $1}
    }
}
