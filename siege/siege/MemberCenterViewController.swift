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
    
    
    @IBAction func signUpAction(_ sender: Any) {
        let signUpAlert = UIAlertController(title: "註冊", message: "建立一個新帳戶", preferredStyle: .alert)
               let saveAction = UIAlertAction(title: "創建", style: .default) { (action) in
                   let emailSignUpTextField = signUpAlert.textFields![0]
                   let passwordSignUpTextField = signUpAlert.textFields![1]
                   Auth.auth().createUser(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!, completion: { (user, error) in
                       if error == nil {
                           Auth.auth().signIn(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!, completion: nil)
                       } else {
                           let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                           let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                           alert.addAction(defaultAction)
                           self.present(alert, animated: true, completion: nil)
                       }
                   })
               }
               
               let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
               
               signUpAlert.addTextField { (emailSignUpTextField) in
                   emailSignUpTextField.placeholder = "請輸入Email"
               }
               signUpAlert.addTextField { (passwordSignUpTextField) in
                   passwordSignUpTextField.placeholder = "請輸入密碼"
                   passwordSignUpTextField.isSecureTextEntry = true
               }
               
               signUpAlert.addAction(saveAction)
               signUpAlert.addAction(cancelAction)
               
               present(signUpAlert, animated: true, completion: nil)
        
        
    }
    
}
