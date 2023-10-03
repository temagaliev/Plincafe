//
//  MapViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 29.09.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        mapView.layer.cornerRadius = 20
        
        let initialLocation = CLLocation(latitude: 45.471990, longitude: 9.207015)
        mapView.centerLoaction(initialLocation)
        let cameraCenter = CLLocation(latitude: 45.471990, longitude: 9.207015)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
        mapView.setCameraZoomRange(zoomRage, animated: true)
        
        let coordinate = CLLocationCoordinate2D(latitude: 45.471990, longitude: 9.207015)
        
        let place = Place(title: "PLINCAFE", locationName: "Winter Rd, Pikangikum, ON P0V 2L0, Canada", discipline: "PlinCafe", coordinate: coordinate)
    
        mapView.addAnnotation(place)
//        mapView.setCenter(coordinate, animated: true)
    }
}

extension MKMapView {
    func centerLoaction(_ location: CLLocation, regionRadius: CLLocationDistance = 90) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
