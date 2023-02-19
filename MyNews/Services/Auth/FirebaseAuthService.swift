//
//  FirebaseAuthService.swift
//  MyNews
//
//  Created by Aksilont on 19.02.2023.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService: AuthServiceProtocol {
    
    private let auth = Auth.auth()
    
    func login(email: String, password: String, completion: @escaping (Result<UserProtocol, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard result != nil else {
                completion(.failure(error!))
                return
            }
            let newUserProfile = UserProfile(email: email, password: password)
            completion(.success(newUserProfile))
        }
    }
    
    func register(email: String, password: String, completion: @escaping (Result<UserProtocol, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard result != nil else {
                completion(.failure(error!))
                return
            }
            let newUserProfile = UserProfile(email: email, password: password)
            completion(.success(newUserProfile))
        }
    }
    
}
