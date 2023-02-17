//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Aksilont on 06.05.2021.
//

import UIKit
import CoreLocation

struct Place {
    var name: String
    var coordinate: CLLocationCoordinate2D
}

extension Place {
    static func mockPlacesWith(center: CLLocationCoordinate2D) -> [Place] {
        (1...5)
            .map { index in
                let rndLatitude = center.latitude + Double(Int.random(in: -10...10)) / 500
                let rndLongitude = center.longitude + Double(Int.random(in: -10...10)) / 500
                return Place(name: "Place \(index)",
                             coordinate: CLLocationCoordinate2D(latitude: rndLatitude, longitude: rndLongitude))
            }
    }
}
