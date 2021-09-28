import UIKit
import RxSwift
import RxCocoa
import RxTest


//let scheduler = TestScheduler(initialClock: 0)
//let observable = scheduler.createHotObservable([
//    Recorded.next(1, "R"),
//    Recorded.next(2, "Rx"),
//    Recorded.next(3, "RxS"),
//    Recorded.next(4, "RxSw"),
//    Recorded.next(5, "RxSwi"),
//    Recorded.next(6, "RxSwift")
//])
//
//_ = observable
//    .debounce(.seconds(1), scheduler: scheduler)
//    .subscribe(onNext: {
//        print("onNext:", $0)
//    })
//
//scheduler.start()



//let time = DispatchTimeInterval.milliseconds(3)
//print(time)

//let observable = Observable.of(
//"R",
//"Rx",
//"RxS",
//"RxSw",
//"RxSwi",
//"RxSwif",
//"RxSwift"
//).debounce(<#T##dueTime: RxTimeInterval##RxTimeInterval#>, scheduler: <#T##SchedulerType#>)
//
//_ = observable
//    .filter({ $0.count >= 2 })
//    .map({ $0.lowercased() })
//.subscribe(onNext: {
//    print("onNext: ", $0)
//}, onCompleted: { print("終了")
//})
//


//public enum TestError : Error {
//    case test
//}
//let observable = Observable<String>.create { observer in
//    observer.onNext("A")
//    observer.onError(TestError.test)
//    return Disposables.create()
//}
//

//// 1.
//_ = observable.materialize()
//.subscribe(onNext: { (event: Event<String>) in
//    switch event {
//    case .next(let value):
//        print("value: \(value)")
//    case .error(let error):
//        print("error: \(error)")
//    case .completed:
//break }
//}, onError: {
//    print("onError, onError: \($0)")
//}, onCompleted: {
//    print("onCompleted:")
//})
//
//
//
//public enum TestError : Error {
//    case test
//}
//
//let sequenceThatErrors = Observable<String>.create { observer in
//   observer.onNext("A")
//   observer.onError(TestError.test)
//
//   observer.onNext("B")
//   observer.onCompleted()
//   return Disposables.create()
//}
//
//_ = sequenceThatErrors
//    .catchAndReturn("Z") // 1.
//.subscribe(onNext: {
//    print("onNext: \($0)")
//}, onError: {
//    print("onError: \($0)")
//}, onCompleted: {
//    print("onCompleted:")
//}, onDisposed: {
//    print("onDisposed:")
//})
//
//
//
//public enum TestError : Error {
//    case test
//}
//
//let sequenceThatErrors = Observable<String>.create { observer in
//    observer.onNext("A")
//    observer.onError(TestError.test)
//
//    observer.onNext("B")
//    observer.onCompleted()
//
//    return Disposables.create()
//}
//
//_ = sequenceThatErrors
//// 1.
//.catchError { error in
//    // 2.
//    if error is TestError {
//        return Observable.just("Z")
//    } else {
//        return Observable.empty()
//    }
//}
//.subscribe(onNext: {
//    print("onNext: \($0)")
//}, onError: {
//    print("onError: \($0)")
//}, onCompleted: {
//    print("onCompleted:")
//}, onDisposed: {
//    print("onDisposed:")
//})
//
//
//
//
//public enum TestError : Error {
//    case test
//}
//
//let sequenceThatErrors = Observable<String>.create { observer in
//    observer.onNext("A")
//    observer.onError(TestError.test)
//    print("Error encountered")
//
//    observer.onNext("B")
//    observer.onCompleted()
//    return Disposables.create()
//}
//
//sequenceThatErrors
//.retry(3) // 1.
//.subscribe(onNext: {
//    print("onNext: \($0)")
//}, onError: {
//    print("onError: \($0)")
//}, onCompleted: {
//    print("onCompleted:")
//}, onDisposed: {
//    print("onDisposed:")
//})
//
//
//
//let subject = PublishSubject<String>()
//
//let disposable = subject
//
//.subscribe(onNext: {
//    print("onNext: \($0)")
//}, onError: {
//    print("onError: \($0)")
//}, onCompleted: {
//    print("onCompleted:")
//
//}, onDisposed: {
//    print("onDisposed:")
//})
//
//subject.onNext("A")
//
//disposable.dispose()
//
//subject.onNext("B")
//
//subject.onCompleted()
//
//
//
////リスト1.2: Observableによる異常終了
//
//public enum TestError : Error {
//    case test
//}
//
//let sequence = Observable.of(1, 2)
//    .flatMap { string -> Observable<String> in
//        print("flatMap: \(string)")
//        let observable = Observable<String>.create { observer in
//            observer.onNext("A")
//            observer.onError(TestError.test)
//            observer.onNext("B")
//            return Disposables.create() {
//                print("Dispose Action:")
//            }
//        }
//        return observable
//    }
//
//_ = sequence
//    .subscribe(onNext: {
//        print("onNext: \($0)")
//    }, onError: {
//        print("onError: \($0)")
//    }, onCompleted: {
//        print("onCompleted:")
//    }, onDisposed: {
//        print("onDisposed:")
//    })
//
//
////リスト1.1: Observableによる正常終了
//let sequence = Observable.of(1, 2)
//    .flatMap { string -> Observable<String> in
//        print("flatMap: \(string)")
//        let observable = Observable<String>.create { observer in
//            observer.onNext("A")
//            observer.onCompleted()
//            observer.onNext("B")
//            return Disposables.create() {
//                print("Dispose Action:")
//            } }
//        return observable
//    }
//
//_ = sequence
//    .subscribe(onNext: {
//        print("onNext: \($0)")
//    }, onError: {
//        print("onError: \($0)")
//    }, onCompleted: {
//        print("onCompleted:")
//    }, onDisposed: {
//        print("onDisposed:")
//    })
