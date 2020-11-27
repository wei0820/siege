//
//  TaipeiPageViewController.swift
//  siege
//
//  Created by oneplay on 2020/11/27.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class TaipeiPageViewController: MGooogleAdsViewController  ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabview: UITableView!
    var itemName = ["1","2","3","4","5","6"]
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

        
    }


}
