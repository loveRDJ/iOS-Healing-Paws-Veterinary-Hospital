//
//  LoginViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/2/29.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.text="Error shows here"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Login(_ sender: Any) {
        let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //valid the text fields
        
        //signing in the user
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.ErrorLabel.text = error?.localizedDescription
                self.ErrorLabel.alpha = 1
            }else{
                self.transitionToHome()
            }
        }
    }
    
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? TabBarViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }

}
