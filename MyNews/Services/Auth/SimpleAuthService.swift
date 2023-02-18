//
//  SimpleAuthService.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation

class SimpleAuthService: AuthServiceProtocol {
    func check(email: String, password: String) -> Bool {
        if email == "test@mail.ru",
           password == "123456" {
            return true
        } else { return true }
    }
    
    func create(email: String, password: String) -> User {
        User(email: email, password: password)
    }
}
