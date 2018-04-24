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
    var actCalories: Float
    var expCalories: Int
    
    //MARK: Encode/Decode Struct Properties
    //static as these constants belong to the structure itself and not its instances (e.g. PropertyKey.LogTime)
    struct PropertyKey
    {
        static let LogTime = "LogTime"
        static let gramSize = "gramSize"
        static let foodName = "foodName"
        static let foodPhoto = "foodPhoto"
        static let foodCarbs = "foodCarbs"
        static let foodFats = "foodFats"
        static let foodProteins = "foodProteins"
        static let foodCalories = "foodCalories"
        static let actCalories = "actCalories"
        static let expCalories = "expCalories"
    } //end struct
    
    //MARK: Initialisation
    init?(Time:String, Gram: Int, Name: String, Photo: UIImage?, Carbs: Int, Fats: Int, Proteins: Int, Kcals: Int)
    {
        
        
        // Initialize stored properties.
        self.LogTime = Time //get time
        self.foodName = Name
        self.gramSize = Gram
        self.foodPhoto = Photo!
        self.foodCarbs = Carbs
        self.foodFats = Fats
        self.foodProteins = Proteins
        self.foodCalories = Kcals
        self.actCalories = (Float(Kcals)*Float((Gram/100)))
        self.expCalories = ((Carbs*4)+(Fats*9)+(Proteins*4))
        print("Total Cals: \(self.actCalories)")
        print("Expected Calories is \(self.expCalories)")
        

    }//end initialisation
    
    
    
} //end class specifier


