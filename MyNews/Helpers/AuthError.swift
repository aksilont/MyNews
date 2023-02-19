//
//  AuthError.swift
//  MyNews
//
//  Created by Aksilont on 19.02.2023.
//

import Foundation

enum AuthError: Error {
    case notFilled
    case incorrectEmail
    case invalidEmailPassword
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .incorrectEmail:
            return NSLocalizedString("Формат почты не является допустимым", comment: "")
        case .invalidEmailPassword:
            return NSLocalizedString("Неправильная почта или пароль", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Ошибка сервера", comment: "")
        }
    }
}
