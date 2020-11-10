//
//  MemberCenterViewController.swift
//  siege
//
//  Created by oneplay on 2020/11/5.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
import FileProvider

class MemberCenterViewController: MGooogleAdsViewController {
    
    @IBOutlet weak var isNoLoginView: UIView!
    @IBOutlet weak var isMailLoginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func isMailLogin(_ sender: Any) {
        isNoLoginView.isHidden = true
    }
    
}
