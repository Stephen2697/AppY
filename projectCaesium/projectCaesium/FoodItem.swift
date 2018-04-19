//
//  Meal.swift
//  123
//
//  Created by Stephen Alger on 19/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class FoodItem {
    
    //MARK: Food Variables
    var logTime : Time
    var foodName: String
    var foodPhoto: UIImage
    var foodCarbs: Int
    var foodFats: Int
    var foodProteins: Int
    var foodCalories: Int
    var expCalories: Int
    
    init?(foodName: String, foodPhoto: UIImage?, foodCarbs: Int, foodFats: Int, foodProteins: Int, foodCalories: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if (foodName.isEmpty) || (foodCarbs<0) || (foodFats<0) || (foodProteins<0) || (foodCalories<0)
        {
            return nil
        }
        
        // Initialize stored properties.
        self.logTime = //get time
            self.foodName = foodName
        self.foodPhoto = foodPhoto
        self.foodCarbs = foodCarbs
        self.foodFats = foodFats
        self.foodProteins = foodProteins
        self.foodCalories = foodCalories
        self.expCalories = ((foodCarbs*4)+(foodFats*9)+(foodProteins*4))
        //print("Expected Calories is \(self.expCalories)")
        
    }
    
}


