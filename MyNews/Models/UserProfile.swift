//
//  UserProfile.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation

protocol UserProtocol {
    var id: UUID { get set }
    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
}

struct UserProfile: UserProtocol, Identifiable {
    var id: UUID = UUID()
    var name: String = "user"
    var email: String
    var password: String
}
