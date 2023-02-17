//
//  AuthService.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation

protocol AuthServiceProtocol {
    func check(email: String, password: String) -> Bool
    func create(email: String, password: String) -> User
}
