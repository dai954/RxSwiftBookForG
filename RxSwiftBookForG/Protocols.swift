//
//  Protocols.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/10/16.
//

import Foundation
import RxSwift

enum ValidationResult {
    case ok(message: String)
    case empty
    case validating
    case failed(message: String)
}

protocol GitHubValidationService {
    func validateUsername(_ username: String) -> Observable<ValidationResult>
    func validatePassword(_ password: String) -> ValidationResult
    func validatePasswordRepeated(_ password: String, repeatedPassword: String) -> ValidationResult
}

protocol GitHubAPI {
    func usernameAvailable(_ username: String) -> Observable<Bool>
    func signup(_ username: String, _ password: String) -> Observable<Bool>
}
