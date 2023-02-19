//
//  MapService.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import Foundation
import MapKit

class MapService: NSObject {
    
    // MARK: - Properties
    
    private let mapView: MKMapView
    private var lastRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // MARK: - Init
    
    init(mapView: MKMapView) {
        self.mapView = mapView
    }
    
    // MARK: - Methods
    
    func setupPoints(points: [PointProtocol]) {
        var annotations: [MKPointAnnotation] = []
        
        for point in points {
            let annotation = MKPointAnnotation()
            annotation.title = point.name
            annotation.coordinate = point.coordinate
            annotations.append(annotation)
        }
        mapView.showAnnotations(annotations, animated: true)
        
        var region = mapView.region
        region.span.latitudeDelta *= 1.5
        region.span.longitudeDelta *= 1.5
        lastRegion = region
        focusLastRegion()
    }
    
    func focusLastRegion() {
        mapView.setRegion(lastRegion, animated: true)
    }
    
}

// MARK: - MKMapViewDelegate

extension MapService: MKMapViewDelegate {
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
