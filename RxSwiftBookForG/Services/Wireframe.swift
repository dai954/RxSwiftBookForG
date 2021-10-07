//
//  Wireframe.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/10/07.
//

import RxSwift

protocol Wireframe {
    func promptFor<Action: CustomStringConvertible>(_ message: String, cancelAction: Action, actions: [Action]) -> Observable<Action>
}

class DefaultWireframe: Wireframe {
    
    static let shared = DefaultWireframe()
    
    static func rootViewController() -> UIViewController {
        return (UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController)!
    }
    
    func promptFor<Action>(_ message: String, cancelAction: Action, actions: [Action]) -> Observable<Action> where Action : CustomStringConvertible {
        
        return Observable.create { observer in
            
            let alertView = UIAlertController(title: "RxExample", message: message, preferredStyle: .alert)
            
            alertView.addAction(UIAlertAction(title: cancelAction.description, style: .cancel, handler: { _ in
                observer.on(.next(cancelAction))
            }))
            
            for action in actions {
                alertView.addAction(UIAlertAction(title: action.description, style: .default, handler: { _ in
                    observer.on(.next(cancelAction))
                }))
            }
            
            DefaultWireframe.rootViewController().present(alertView, animated: true, completion: nil)
            
            return Disposables.create {
                alertView.dismiss(animated: false, completion: nil)
            }
        }
        
    }
}

