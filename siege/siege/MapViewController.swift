//
//  MapViewController.swift
//  siege
//
//  Created by oneplay on 2020/11/2.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: MGooogleAdsViewController , MGLMapViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
         
        mapView.styleURL = MGLStyle.outdoorsStyleURL
         
        // Mauna Kea, Hawaii
        let center = CLLocationCoordinate2D(latitude: 25.0521804378019, longitude: 121.53867317285828)
         
        // Optionally set a starting point.
        mapView.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
         
        view.addSubview(mapView)
    }
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
    // Wait for the map to load before initiating the first camera movement.
     
    // Create a camera that rotates around the same center point, rotating 180°.
    // `fromDistance:` is meters above mean sea level that an eye would have to be in order to see what the map view is showing.
    let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, altitude: 4500, pitch: 15, heading: 180)
     
    // Animate the camera movement over 5 seconds.
    mapView.setCamera(camera, withDuration: 5, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
    }

}
