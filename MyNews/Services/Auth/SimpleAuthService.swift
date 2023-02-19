//
//  SimpleAuthService.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation

class SimpleAuthService: AuthServiceProtocol {
    
    func login(email: String, password: String, completion: @escaping (Result<UserProtocol, Error>) -> Void) {
        if email == "test@mail.ru", password == "123456" {
            completion(.success(UserProfile(email: email, password: password)))
        } else {
            completion(.failure(AuthError.invalidEmailPassword))
        }
    }
    
    func register(email: String, password: String, completion: @escaping (Result<UserProtocol, Error>) -> Void) {
        completion(.success(UserProfile(email: email, password: password)))
    }
    
}
