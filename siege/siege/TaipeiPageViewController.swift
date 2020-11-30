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
    var itemName = ["",""]
    var string = ["士林區","大同區","大安區","中山區","中正區","內湖區","文山區","北投區","松山區","信義區","南港區","萬華區"]
    var string2 = ["八里區","三芝區","三重區","三峽區","土城區","中和區","五股區","平溪區","永和區","石門區","石碇區","汐止區","坪林區","林口區","板橋區","金山區","泰山區","烏來區","貢寮區","淡水區","深坑區","新店區","新莊區","瑞芳區","萬里區","樹林區","雙溪區","蘆洲區","鶯歌區"]
    var string3 = ["八德區","大園區","大溪區","中壢區","平鎮區","桃園區","復興區","新屋區","楊梅區","龍潭區","龜山區","蘆竹區","觀音區"]
    var string4  =  ["中區","北屯區","北區","西屯區","西區","東區","南屯區","南區","大甲區","大安區","大肚區","大里區","大雅區","太平區","外埔區","石岡區","后里區","和平區","東勢區","烏日區","神岡區","梧棲區","清水區","新社區","潭子區","豐原區","霧峰區"]
    var string5 =  ["中西區","北區","安平區","安南區","東區","南區","七股區","大內區","山上區","仁德區","六甲區","北門區","左鎮區","永康區","白河區","安定區","佳里區","官田區","東山區",
                    "南化區","後壁區","柳營區","將軍區","麻豆區","善化區","新化區","新市區","新營區","楠西區","學甲區","龍崎區","歸仁區","關廟區","鹽水區"]
    var string6  =  ["三民區","小港區","左營區","前金區","前鎮區","苓雅區","新興區","楠梓區","鼓山區","旗津區","鹽埕區","那瑪夏區","大社區","大寮區","大樹區","內門區","六龜區","田寮區","甲仙區","杉林區","岡山區","林園區","阿蓮區","美濃區","茄萣區","茂林區","桃源區","鳥松區","湖內區","旗山區","鳳山區","橋頭區","燕巢區","彌陀區"]
    
    
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
        case "3" :
            itemName  = string4
            break
        case "4" :
            itemName  = string5
            break
        case "5" :
            itemName  = string6
            break
        
      
        default:
            itemName   = ["",""]

        }

        
    }


}
