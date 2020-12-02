//
//  OtherCityViewController.swift
//  siege
//
//  Created by oneplay on 2020/11/19.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class OtherCityViewController: MGooogleAdsViewController ,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tabview: UITableView!
    var itemName:Array<String> = Array()
    var name :String = ""
    
    @IBOutlet weak var dissview: UIButton!
    
    @IBAction func dissviewAction(_ sender: Any) {
        dissmissView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for:indexPath)
        cell.textLabel?.text = itemName[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(
            at: indexPath, animated: true)
        name = itemName[indexPath.row]
        performSegue(withIdentifier: "other", sender: self)


    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "other"{
            if let index = tabview.indexPathForSelectedRow{
                let secondCV = segue.destination as! OtherCityListViewController
                secondCV.detail = String(index.row)

            }


        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemName.append("基隆市")
        itemName.append("新竹市")
        itemName.append("新竹縣")
        itemName.append("苗栗縣")
        itemName.append("彰化縣")
        itemName.append("南投縣")
        itemName.append("雲林縣")
        itemName.append("嘉義縣")
        itemName.append("嘉義市")
        itemName.append("屏東縣")
        itemName.append("宜蘭縣")
        itemName.append("花蓮縣")
        itemName.append("台東縣")

        
    }


}
