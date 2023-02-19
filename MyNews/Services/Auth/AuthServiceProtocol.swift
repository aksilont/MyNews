//
//  AuthService.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation

protocol AuthServiceProtocol {  
    func login(email: String, password: String, completion: @escaping(Result<UserProtocol, Error>) -> Void)
    func register(email: String, password: String, completion: @escaping(Result<UserProtocol, Error>) -> Void)
}
