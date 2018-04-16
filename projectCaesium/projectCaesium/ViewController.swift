//
//  ViewController.swift
//  projectCaesium
//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameFoodItem: UITextField!
    @IBOutlet weak var dsiplayedFoodItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        nameFoodItem.delegate = self
    }
    
    
    //MARK: UITextFieldDelegate
    //Using a delegate to handle textfield interaction
    
    //Handle event when User has finished editing textfield
    //Called by system when Return is entered on Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Resign textField's first responder status...
        //This acts to Hide the keyboard
        textField.resignFirstResponder()
        
        //True - we want to process enter data after the return key being pressed
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        dsiplayedFoodItem.text = textField.text
    }
    
    
    
    //MARK: Actions
    
    @IBAction func addFoodItem(_ sender: UIButton) {
    }
    
}

