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
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var isMailLoginDatView: UIView!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var isNoLoginView: UIView!
    @IBOutlet weak var isMailLoginButton: UIButton!
    @IBOutlet weak var emailLoginTextField: UITextField!
    
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    @IBOutlet weak var isMailLoginView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkMailLogin()
    }
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailLoginTextField.text!, password: passwordLoginTextField.text!) { (user, error) in
             if (error != nil) {
                 let alert = UIAlertController(title: "發生錯誤", message: error?.localizedDescription, preferredStyle: .alert)
                 let defaultAction = UIAlertAction(title: "發生錯誤", style: .cancel, handler: nil)
                 alert.addAction(defaultAction)
                 self.present(alert, animated: true, completion: nil)
             }
         }
    }
    
    @IBAction func isMailLogin(_ sender: Any) {
        isNoLoginView.isHidden = true
        isMailLoginView.isHidden = false
        isMailLoginDatView.isHidden = true
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
    
    func checkMailLogin(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.idLabel.text = "ID:" + user!.uid
                self.mailLabel.text = "Mail:" + (user?.email)!
        
                self.isNoLoginView.isHidden = true
                self.isMailLoginView.isHidden = true
            }else{
                self.isNoLoginView.isHidden = false
                self.isMailLoginView.isHidden = true
                self.isMailLoginDatView.isHidden = true
                
            }
            
        }
    }
    
    
    @IBAction func resetPasswordForMail(_ sender: Any) {
        
        let signUpAlert = UIAlertController(title: "忘記密碼", message: "發送重設密碼信件", preferredStyle: .alert)
                   let saveAction = UIAlertAction(title: "發送", style: .default) { (action) in
                       let emailSignUpTextField = signUpAlert.textFields![0]
                    
                    Auth.auth().sendPasswordReset(withEmail: emailSignUpTextField.text!) { error in
                          if (error != nil) {
                                   let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                                   let defaultAction = UIAlertAction(title: "Error", style: .cancel, handler: nil)
                                   alert.addAction(defaultAction)
                                   self.present(alert, animated: true, completion: nil)
                               }
                    }
                
                   }
                   
                   let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                   
                   signUpAlert.addTextField { (emailSignUpTextField) in
                       emailSignUpTextField.placeholder = "請輸入Email"
                   }
                   signUpAlert.addAction(saveAction)
                    signUpAlert.addAction(cancelAction)

                   
                   present(signUpAlert, animated: true, completion: nil)
        
        
        
        
        
        
    }
    // 重新驗證用戶
    func reAuthen(email:String ,password: String){
        let user = Auth.auth().currentUser
        var credential: AuthCredential = EmailAuthProvider.credential(withEmail: email, password: password)
        user?.reauthenticateAndRetrieveData(with: credential, completion: {(authResult, error) in
            if let error = error {
                // An error happened.
            }else{
                // User re-authenticated.
            }
        })
        }
    
    
    @IBAction func logoutAction(_ sender: Any) {
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
        }
          
    }
    
    
    
        
    @IBAction func deleteAccountAction(_ sender: Any) {
    }
    
    
    
    
}
