//
//  User.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    let name: String = "user"
    let email: String
    let password: String
}
