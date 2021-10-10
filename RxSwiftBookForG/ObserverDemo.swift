//
//  ObserverDemo.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/10/10.
//

import Foundation

enum Event<Element> {
    case next(Element)
    case completed
}

protocol ObserverType {
    associatedtype Element
    func on(_ event: Event<Element>)
}

struct AnyObserver<Element>: ObserverType {
    private let eventHandler: (Event<Element>) -> ()

    init(eventHandler: @escaping (Event<Element>) -> ()) {
        self.eventHandler = eventHandler
    }

    func on(_ event: Event<Element>) {
        eventHandler(event)
    }
}

class Observable<Element> {

    func subscribe(onNext: ((Element) -> ())? = nil, onCompleted: (() -> ())? = nil ) {
        let observer = AnyObserver<Element> { event in
            switch event {
            case .next(let value):
                onNext?(value)
            case .completed:
                onCompleted?()
            }
        }
        subscribe(observer)
    }

    func subscribe<Observer: ObserverType>(_ observer: Observer) where Observer.Element == Element {
        preconditionFailure("このメソッドが呼ばれると実装ミス")
    }

}

class Just<Element>: Observable<Element> {
    private let element: Element

    init(element: Element) {
        self.element = element
    }

    override func subscribe<Observer: ObserverType>(_ observer: Observer) where Observer.Element == Element {
        observer.on(.next(element))
        observer.on(.completed)
    }
}

extension Observable {
    
    static func just(_ element: Element) -> Observable {
        Just(element: element)
    }
    
}
