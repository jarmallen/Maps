//
//  ViewController.swift
//  Maps
//
//  Created by Jared Allen on 1/25/16.
//  Copyright © 2016 Jared Allen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Blue Lagoon, Iceland
        
        let latitude: CLLocationDegrees = 63.879692
        let longitude: CLLocationDegrees = -22.445377
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        
        
        // Annotations
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Blue Lagoon"
        annotation.subtitle = "Iceland"
        
        map.addAnnotation(annotation)
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "newAnnotation:")
        
        longPressGesture.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPressGesture)
        

        
    }
    
    func newAnnotation(gestureRecognizer: UIGestureRecognizer) {
        print("Gesture Recognized")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let newAnnotation = MKPointAnnotation()
        
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = "New Place"
        
        map.addAnnotation(newAnnotation)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)

        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/*

    var latitude: CLLocationDegrees = 40.7
    var longitude: CLLocationDegrees = -73.9
    
    var latDelta: CLLocationDegrees = 0.01
    var lonDelta: CLLocationDegrees = 0.01
    
    var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
    
    var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
    
    var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
    
    map.setRegion(region, animated: true)
    
*/
    
    
    
    
    
    
    
    
    
    


}




























