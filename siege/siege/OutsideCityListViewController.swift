//
//  OutsideCityListViewController.swift
//  siege
//
//  Created by oneplay on 2020/11/30.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class OutsideCityListViewController: MGooogleAdsViewController  ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabview: UITableView!
    var itemName = ["",""]
    var string = ["七美鄉","白沙鄉","西嶼鄉","馬公市","望安鄉","湖西鄉"]
    var string2 = ["金沙鎮","金城鎮","金湖鎮","金寧鄉","烈嶼鄉"]
    var string3 = ["南竿鄉","東引鄉"]
    
    var name : String   = ""
    var detail :String = ""
    
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

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Jack","ts:"+detail)
        switch detail {
        case "0":
            itemName  = string
            break
        case "1" :
            itemName  = string2

            break
        case "2" :
            itemName  = string3
            break
        default:
            itemName   = ["",""]
        }

        
    }


}
