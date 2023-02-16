//
//  News.swift
//  MyNews
//
//  Created by Aksilont on 16.02.2023.
//

import UIKit

struct News {
    let image: UIImage?
    let date: Date
    var liked: Bool
    
    let title: String
    let textNews: String
}

extension News {
    static func mockData() -> [News] {
        let mockTitle = "Lorem ipsum dolor sit"
        let mockTextNews: String =
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
        """
        
        return (1...10)
            .map { _ in
                let mockImage = UIImage(named: "SomeImage\(Int.random(in: 1...3))")
                let mockDate = Date().addingTimeInterval(-TimeInterval(86400 * Int.random(in: 1...30)))
                let mockLike = Bool(exactly: Int.random(in: (0...1)) as NSNumber) ?? false
                return News(image: mockImage, date: mockDate, liked: mockLike, title: mockTitle, textNews: mockTextNews)
            }
            .sorted(by: { $0.date > $1.date })
    }
}
