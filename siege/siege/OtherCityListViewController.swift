//
//  OtherCityListViewController.swift
//  siege
//
//  Created by oneplay on 2020/12/2.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class OtherCityListViewController: MGooogleAdsViewController  ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabview: UITableView!
    var itemName = ["",""]
    var string = ["七堵區","中山區","中正區","仁愛區","安樂區","信義區","暖暖區"]
    var string2 = ["東區","北區","香山區"]
    var string3 = ["南竿鄉","東引鄉"]
    var  n : Array<String> = [] 
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
        
               let path = Bundle.main.path(forResource: "data", ofType: "json")
               let loaclData = NSData.init(contentsOfFile: path!)! as Data
                  do {
                      let students = try JSONDecoder().decode(DateJson.self, from: loaclData)
                   print("Jack\(students.list[7].name)")
                   print("Jack\(students.list[7].districts[0].name)")
                    students.list[7].districts.forEach { (districts) in
                        n.append(districts.name)
                    }
                      
                  } catch {
                      debugPrint("student===ERROR")
                      // 异常处理
                  }
        
        print("JacK",n.count)
        
        switch detail {
        case "0":
            itemName  = string
            break
        case "1" :
            itemName  = string2

            break
        case "2" :
            itemName = n
            break
        case "3" :
            itemName = n
            
        default:
            itemName   = ["",""]
        }

        
    }


}
