//
//  Date+SimpleFormat.swift
//  MyNews
//
//  Created by Aksilont on 16.02.2023.
//

import Foundation

extension Date {
    func simpleFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        formatter.locale = Locale(identifier: "RU")
        return formatter.string(from: self)
    }
}
