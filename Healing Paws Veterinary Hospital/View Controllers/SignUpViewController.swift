//
//  SignUpViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/2/29.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.text="Error shows here"
        // Do any additional setup after loading the view.
     
    }
    
    //check the field and the validate, and return a string if it is not validate
    func validateField() -> String?{
        if FirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || LastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || Email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || ConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields"
        }
        
        //check if email is validate
        let e_mail = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isValidEmail(testStr: e_mail) == false
        {
            return "Please make sure your email is validate"
        }
        
        //check if the password is validate
        let pass = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(pass) == false
        {
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        
        let confirmPass = ConfirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if confirmPass != pass
        {
            return "Please make sure your password is same"
        }
        
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
          return true
        }else{
          return false
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }

    @IBAction func SignUp(_ sender: Any) {
        //Validate the text
        let error = validateField()
        if error != nil{
            showError(error!)
        }
        else{
            
            //create cleaned version of the data
            let firstName = FirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = LastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create a user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    //there was an error creating the user
                    self.showError("Error creating user")
                }else{
                    //user was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    print(Auth.auth().currentUser!.uid+"[[[[[[[[[[[[[[[[[[[[[[[[")
                    self.transitionToHome()
                    db.collection("users").document("ihaIi5mVaQZXzx4YCInm").setData(["first_name":firstName, "last_name":lastName])
//                    db.collection("users").addDocument(data: ["first_name":firstName, "last_name":lastName, "uid":Auth.auth().currentUser!.uid])
//                    self.transitionToHome()
//                    db.collection("users").addDocument(data: ["first_name":firstName, "last_name":lastName, "uid":result!.user.uid]) { (error) in
//
//                        if error != nil{
//                            print("EorroRRRRRRRR",error.debugDescription)
//                            self.showError("Error saving user data")
//                        }else{
//                            print("No error")
//                            self.showError("No Error")
//                        }
//                    }
//                    self.transitionToHome()
                }

            }
            //transition to the home screen
        }
        
        
    }
    
    func showError(_ error: String){
        ErrorLabel.text = error
        ErrorLabel.alpha = 1
    }

    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? TabBarViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
