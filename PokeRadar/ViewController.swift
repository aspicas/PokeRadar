//
//  ViewController.swift
//  PokeRadar
//
//  Created by David Garcia on 1/4/18.
//  Copyright © 2018 David Garcia. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapCentered = false
    var geoFire: GeoFire!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.mapView.userTrackingMode = .follow
        self.locationManager.delegate = self
        locationAuthStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.mapView.showsUserLocation = true
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.mapView.showsUserLocation = true
        }
    }
    
    func centerMap(on location: CLLocation){
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        self.mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if !mapCentered {
            if let location = userLocation.location {
                centerMap(on: location)
                mapCentered = true
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView?
        if annotation.isKind(of: MKUserLocation.self) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotationView?.image = #imageLiteral(resourceName: "character")
        }
        return annotationView
    }

    @IBAction func reportPokemon(_ sender: UIButton) {
    }
    
}

