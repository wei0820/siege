//
//  OutsideCityViewController.swift
//  siege
//
//  Created by oneplay on 2020/11/19.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class OutsideCityViewController: MGooogleAdsViewController ,UITableViewDataSource, UITableViewDelegate {
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
//        performSegue(withIdentifier: "stockdetail", sender: nil)


    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "stockdetail"{
//            if let index = tableview.indexPathForSelectedRow{
//                let secondCV = segue.destination as! StockDetailViewController
//                secondCV.detail =  itemName[index.row].detail
//
//            }
//
//
//        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemName.append("澎湖縣")
        itemName.append("金門縣")
        itemName.append("馬祖")
    


        
    }


}

