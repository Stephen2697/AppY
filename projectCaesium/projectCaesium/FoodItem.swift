//
//  Meal.swift

//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class FoodItem
{
    
    //MARK: Food Variables
    var LogTime: String
    var gramSize: Int
    var foodName: String
    var foodPhoto: UIImage
    var foodCarbs: Int
    var foodFats: Int
    var foodProteins: Int
    var foodCalories: Int
    var expCalories: Int
    
    //MARK: Initialisation
    
    init?(Time:String, Gram: Int, Name: String, Photo: UIImage?, Carbs: Int, Fats: Int, Proteins: Int, Kcals: Int)
    {
        
        // Initialisation will return nil value should any of the following conditions be true
        if ( (Name.isEmpty) || (Carbs<0) || (Fats<0) || (Proteins<0) || (Kcals<0) )
        {
            return nil
        } //end
        
        // Initialize stored properties.
        self.LogTime = Time //get time
        self.foodName = Name
        self.gramSize = Gram
        self.foodPhoto = Photo!
        self.foodCarbs = Carbs
        self.foodFats = Fats
        self.foodProteins = Proteins
        self.foodCalories = Kcals
        self.expCalories = ((Carbs*4)+(Fats*9)+(Proteins*4))
        //print("Expected Calories is \(self.expCalories)")
        

    }//end initialisation
    
    
    
} //end class specifier


