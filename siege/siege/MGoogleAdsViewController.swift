//
//  MGoogleAdsViewController.swift
//  siege
//
//  Created by oneplay on 2020/10/26.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
import CoreLocation
import Network

class MGooogleAdsViewController: UIViewController ,GADBannerViewDelegate, CLLocationManagerDelegate {
    var adBannerView: GADBannerView!
    var _locationManager : CLLocationManager!
    var testAd: String = "ca-app-pub-3940256099942544/2934735716"
    var productAd :String = "ca-app-pub-7019441527375550/9564992118"
    let monitor = NWPathMonitor()

    override func viewDidLoad() {
        
        setAdBanner()
        checkNetwork()
        
        // 生成 CLLocationManager 這物件
        _locationManager = CLLocationManager()
        // 指定其代理 delegate 委任對象
        _locationManager.delegate = self
        /*  設置自身定位精準度 _locationManager.desiredAccuracy
         *  設置移動距離精準度 _locationManager.distanceFilter
         *      kCLLocationAccuracyBestForNavigation：精確度最高，適用於導航的定位。
         *      kCLLocationAccuracyBest：精確度高。
         *      kCLLocationAccuracyNearestTenMeters：精確度 10 公尺以內。
         *      kCLLocationAccuracyHundredMeters：精確度 100 公尺以內。
         *      kCLLocationAccuracyKilometer：精確度 1 公里以內。
         *      kCLLocationAccuracyThreeKilometers：精確度 3 公里以內。
         */
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        _locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        _locationManager.requestAlwaysAuthorization()
        _locationManager.requestWhenInUseAuthorization()
        // 表示移動 10 公尺再更新座標資訊
        _locationManager.distanceFilter = CLLocationDistance(10)
        // 開始接收目前位置資訊
        _locationManager.startUpdatingLocation()
        
    }
    func checkNetwork(){
        monitor.pathUpdateHandler = { path in
             if path.status == .satisfied {
                print("jack","connected")
                print("jack", path.usesInterfaceType(.wifi))
                print("jack", path.usesInterfaceType(.cellular))

               
             } else {
                print("jack","no connection")
             }
          }
    
          monitor.start(queue: DispatchQueue.global())
        print("jack", monitor.currentPath.status)

    }
    
    func setAdBanner(){
        let id = testAd
        adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView!.adUnitID = id
        adBannerView!.delegate = self
        adBannerView!.rootViewController = self
        adBannerView!.load(GADRequest())
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        addBannerViewToView(bannerView)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        _locationManager.stopUpdatingLocation();
    }
    
    // Called when an ad request failed.
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("jack",(error.localizedDescription))
    }
    
    // Called just before presenting the user a full screen view, such as a browser, in response to
    // clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before dismissing a full screen view.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just after dismissing a full screen view.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before the application will background or terminate because the user clicked on an
    // ad that will launch another application (such as the App Store).
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print(#function)
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
        ])
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 取得目前的座標位置
        let _curLocation = locations[0]
        
        // curLocation.coordinate.latitude 目前緯度
        // curLocation.coordinate.longitude 目前經度
        let _nowLocationCoordinate2D = CLLocationCoordinate2D(
            latitude: _curLocation.coordinate.latitude,
            longitude: _curLocation.coordinate.longitude
        )

        print("Jack",reverseGeocodeLocation(_latitude: _curLocation.coordinate.latitude, _longitude: _curLocation.coordinate.longitude))
        

    }
     func reverseGeocodeLocation(_latitude: Double, _longitude: Double) -> Void {
        let geoCoder = CLGeocoder()
        let currentLocation = CLLocation(
            latitude: _latitude,
            longitude: _longitude
        )
        geoCoder.reverseGeocodeLocation(
            currentLocation, completionHandler: {
                (placemarks, error) -> Void in
                if error != nil {
                    // 這邊可以加入一些你的 Try Error 機制
                    return
                }
                /*  name            街道地址
                 *  country         國家
                 *  province        省籍
                 *  locality        城市
                 *  sublocality     縣市、區
                 *  route           街道、路名
                 *  streetNumber    門牌號碼
                 *  postalCode      郵遞區號
                 */
                if placemarks != nil && (placemarks?.count)! > 0{
                    let placemark = (placemarks?[0])! as CLPlacemark
                    //這邊拼湊轉回來的地址
                    print("Jack",placemark.name)
                }
            }
        )
    }
}
