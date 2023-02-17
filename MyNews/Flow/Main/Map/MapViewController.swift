//
//  MapViewController.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet { mapView.delegate = mapService }
    }
    
    // MARK: - Properties
    
    lazy private var places: [Place] = Place.mockPlaces()
    lazy private var mapService = MapService(mapView: mapView)
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapService.setupPoints(points: places)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapService.focusLastRegion()
    }

}
