//
//AddFoodViewController.swift
//  projectCaesium
//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var mealNameBox: UITextField!
    @IBOutlet weak var caloriesBox: UITextField!
    @IBOutlet weak var portionBox: UITextField!
    @IBOutlet weak var proteinBox: UITextField!
    @IBOutlet weak var carbBox: UITextField!
    @IBOutlet weak var fatBox: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.mealNameBox.delegate = self
        self.caloriesBox.delegate = self
        self.portionBox.delegate = self
        self.proteinBox.delegate = self
        self.carbBox.delegate = self
        self.fatBox.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: UITextFieldDelegate
    //Using a delegate to handle textfield interaction
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        mealNameBox.resignFirstResponder()
        caloriesBox.resignFirstResponder()
        carbBox.resignFirstResponder()
        fatBox.resignFirstResponder()
        proteinBox.resignFirstResponder()
        portionBox.resignFirstResponder()
        
        return true
    }

    
}

