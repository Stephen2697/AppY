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

    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        input.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    //Using a delegate to handle textfield interaction
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        output.text = textField.text
    }
    
}

