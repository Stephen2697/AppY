//
//AddFoodViewController.swift
//  projectCaesium
//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit
import os.log

class AddFoodViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate  {

    //MARK: Properties
    //Create our intermediary object variable to allow us to take user input and later save or discard it
    var newFoodItem: FoodItem?
    
    
    
    //Simply revert to previous scene by dismissing current scene should the user press Cancel and any inputted data is not stored.
    @IBAction func cancelButton(_ sender: UIBarButtonItem)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var addPhotoImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var mealNameBox: UITextField!
    @IBOutlet weak var caloriesBox: UITextField!
    @IBOutlet weak var portionBox: UITextField!
    @IBOutlet weak var proteinBox: UITextField!
    @IBOutlet weak var carbBox: UITextField!
    @IBOutlet weak var fatBox: UITextField!
    
    //Gesture Recognising - User Selects to Add Image
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer)
    {
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
    
        imagePickerController.sourceType = .photoLibrary
        
        //alert View Controller when user picks image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: imagePickerControllers
    //Dismiss the Image Picker View on Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    //Deal with users selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        else
        {
            fatalError("Error Recieving Image")
        }
        
        //Display the selected image in the add food item view
        addPhotoImage.image = selectedImage
        
        // Dismiss the image selection view
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.mealNameBox.delegate = self
        self.caloriesBox.delegate = self
        self.portionBox.delegate = self
        self.proteinBox.delegate = self
        self.carbBox.delegate = self
        self.fatBox.delegate = self
        
        //Disable Saves until valid entry
        disableSaveOptNoText()
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
    
    //prevent saves while editing...
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        disableSaveOptNoText()
        navigationItem.title = mealNameBox.text
    }
    
    // Pass the fooditem object between views should the user choose to save this entry.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        //Check the sending object is of type UIBarButtonItem (i.e. a button) and the sending object is the same object as our save button
        guard let button = sender as? UIBarButtonItem, button === saveButton
        else
        {
            //perform console output if the intial guard statement is not true & the save button was not selected
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        //Memory Assignments - take user input as constants
        //(??) unrwaps the optional string returned - if nil is returned an empty string ("") is returned.
//        let foodPhoto = photoImageView.image
        let Time = "20.00" //replace with action time
        
        let Gram: Int? = Int(portionBox.text!)
        let Name = mealNameBox.text ?? ""
        let Photo = UIImage(named: "Sample3")
        let Carbs: Int? = Int(carbBox.text!)
        let Fats: Int? = Int(fatBox.text!)
        let Proteins: Int? = Int(proteinBox.text!)
        let Kcals: Int? = Int(caloriesBox.text!)
        
        
        
        //Configure the new FoodItem object to be passed to MealTableViewController by calling FoodItem's initialiser
        
        newFoodItem = FoodItem(Time:Time, Gram: Gram!, Name: Name, Photo: Photo, Carbs: Carbs!, Fats: Fats!, Proteins: Proteins!, Kcals: Kcals!)
    }
    
    //MARK: Private Functions
    private func disableSaveOptNoText() {
        // Disable the Save button if the text field is empty.
        let mealName = mealNameBox.text ?? ""
        let portion = portionBox.text ?? ""
        let carb = carbBox.text ?? ""
        let fat = fatBox.text ?? ""
        let protein = proteinBox.text ?? ""
        let kcals = caloriesBox.text ?? ""
        
        saveButton.isEnabled = !mealName.isEmpty && !portion.isEmpty && !carb.isEmpty && !fat.isEmpty && !protein.isEmpty && !kcals.isEmpty
    }

    
}

