//
//  MakeViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/4.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit
import TextFieldEffects

class MakeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == locationPickerView{
            return locations.count
        }else{
            return situations.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == locationPickerView{
            return locations[row]
        }else{
            return situations[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == locationPickerView{
            selectedLocation = locations[row]
            locationTextfield.text = selectedLocation
        } else{
            selectedSituation = situations[row]
            situationTextfield.text = selectedSituation
        }
    }
    
    var selectedLocation: String?
    var locations = ["China","Ireland"]
    
    var selectedSituation: String?
    var situations = ["Standard","Emergency"]
    
    let locationPickerView = UIPickerView()
    let situationPickerView = UIPickerView()
    
    func createPickerView(){
        locationPickerView.delegate = self
        situationPickerView.delegate = self
        
        
        locationTextfield.inputView = locationPickerView
        situationTextfield.inputView = situationPickerView
        
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        locationTextfield.inputAccessoryView = toolBar
        situationTextfield.inputAccessoryView = toolBar
        dateTextfield.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBOutlet weak var locationTextfield: AkiraTextField!
    @IBOutlet weak var situationTextfield: AkiraTextField!
    @IBOutlet weak var dateTextfield: AkiraTextField!
    @IBOutlet weak var photoView: UIImageView!
    var datePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Make an appointment"
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextfield.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        createPickerView()
        dismissPickerView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func uploadPhoto(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true){
            //After it is complete
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            photoView.image = image
        }else{
            //Error message
            print("Error with uploading image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        dateTextfield.text = dateFormatter.string(from: datePicker.date)
    }
    
}

extension UITextField{
    
}
