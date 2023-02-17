//
//  MapViewController.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet { mapView.delegate = self }
    }
    
    // MARK: - Properties
    private let coordinateMoscow = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
    private var cordinateRegion: MKCoordinateRegion?
    lazy private var places: [Place] = Place.mockPlacesWith(center: coordinateMoscow)
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPoints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        focusRegion()
    }
    
    // MARK: - Methods
    
    private func setupPoints() {
        var annotations: [MKPointAnnotation] = []
        
        for point in places {
            let annotation = MKPointAnnotation()
            annotation.title = point.name
            annotation.coordinate = point.coordinate
            annotations.append(annotation)
        }
        mapView.showAnnotations(annotations, animated: true)
        
        var region = mapView.region
        region.span.latitudeDelta *= 1.5
        region.span.longitudeDelta *= 1.5
        cordinateRegion = region
        mapView.region = region
    }
    
    private func focusRegion() {
        guard let region = cordinateRegion else { return }
        mapView.setRegion(region, animated: true)
    }

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        let imageSize = CGSize(width: 40, height: 40)
        
        let customAnnotationView = MKAnnotationView()
        customAnnotationView.centerOffset = CGPoint(x: -imageSize.width / 2, y: -imageSize.height)
        
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: imageSize))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "MapMarker")
        
        customAnnotationView.addSubview(imageView)
        return customAnnotationView
    }
}
