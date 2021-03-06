//
//  ViewController.swift
//  siege
//
//  Created by oneplay on 2020/10/22.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class ViewController: MGooogleAdsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLeftButton(s: "會員中心")
        setRightButton(s: "地圖")
   
            
    }
    func setRightButton(s: String){
        // 導覽列右邊按鈕
        
        let LeftButton = UIBarButtonItem(
            title:s,
            style:.plain,
            target:self,
            action:#selector(ViewController.setting))
        // 加到導覽列中
        self.navigationItem.leftBarButtonItem = LeftButton
    }
    @objc func setting() {
        setJump(type: "map")
        
    }
    
    
    func setLeftButton(s: String){
        // 導覽列右邊按鈕
        
        let rightButton = UIBarButtonItem(
            title:s,
            style:.plain,
            target:self,
            action:#selector(ViewController.checkIn))
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func checkIn() {
        setJump(type: "member")

    }
    
    
    @IBAction func sixCityAction(_ sender: Any) {
        setJump(type: "sixcity")
    }
    
    @IBAction func OtherCityAction(_ sender: Any) {
        setJump(type: "othercity")
    }
    
    @IBAction func OutsideCityAction(_ sender: Any) {
        setJump(type: "outsidecity")

    }
    
    

}

