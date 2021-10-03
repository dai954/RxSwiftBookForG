//
//  SomeProtocol.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/09/28.
//

import Foundation

protocol Product {
    var name: String { get }
    var caution: String? { get }
}

extension Product {
    var caution: String? {
        return nil
    }
    
    var description: String {
        var description = "商品名: \(name)"
        if let caution = caution {
            description += "注意事項: \(caution)"
        }
        return description
    }
}

protocol RandomValueGenerator {
    associatedtype Value
    
    func ramdomValue() -> Value
}

struct IntegerRandomValueGenerator: RandomValueGenerator {
//    typealias Value = Int
    
    func ramdomValue() -> Int {
        return Int.random(in: Int.min...Int.max)
    }
    
}

struct StringRandomValueGenerator: RandomValueGenerator {
    
    func ramdomValue() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let offset = Int.random(in: 0..<letters.count)
        let index = letters.index(letters.startIndex, offsetBy: offset)
        print("letters.startIndex",letters.startIndex)
        print("index",index)
        
        return String(letters[index])
    }
}


protocol ProtocolA {
    var id: Int { get }
}

protocol ProtocolB {
    var title: String { get }
}

protocol ProtocolC: ProtocolA, ProtocolB { }

struct SomeStruct1: ProtocolC {
    var id: Int
    var title: String
}

protocol Item {
    var name: String { get }
    var category: String { get }
}

extension Item {
    var description: String {
        return "商品名: \(name), カテゴリ: \(category)"
    }
}

struct Book: Item {
    var name: String
    var category: String {
        return "書籍"
    }
    
}
