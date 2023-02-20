//
//  MockData.swift
//  MyNews
//
//  Created by Aksilont on 20.02.2023.
//

import Foundation

class MockData {
    var mockNews = News.mockData()
    var mockPlaces = Place.mockPlaces()
    
    static let shared = MockData()
    
    private init() {}
}
