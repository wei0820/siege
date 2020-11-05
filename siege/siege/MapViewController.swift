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

    @IBOutlet weak var map: MGLMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        map.setCenter(CLLocationCoordinate2DMake(25.034815, 121.564392), animated: false)
        map.zoomLevel = 13
        map.styleURL = MGLStyle.streetsStyleURL
        map.delegate = self
        map.showsUserLocation = true
         
        
        
        
    }
    
    
    @IBAction func closeview(_ sender: Any) {
        dissmissView()
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
          mapView.setCenter((mapView.userLocation?.coordinate)!, animated: false)
      }
    
      func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
          let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, altitude: 4500, pitch: 15, heading: 180)
          
          // Animate the camera movement over 5 seconds.
          mapView.setCamera(camera, withDuration: 5, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
      }
      
      /*
       // MARK: - Navigation
       
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
       }
       */
      func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
          style.localizeLabels(into: Locale(identifier: "zh-Tw"))
          // Into the local language where a given feature is located
      }

}
