//
//  Meal.swift

//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit
import os.log

class FoodItem: NSObject, NSCoding
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
    var expCalories: Float
    
    //MARK: Encode/Decode Struct Properties
    //static as these constants belong to the structure itself and not its instances (e.g. PropertyKey.LogTime)
    struct PropertyKey
    {
        static let Time = "Time"
        static let Size = "Size"
        static let Name = "Name"
        static let Photo = "Photo"
        static let Carbs = "Carbs"
        static let Fats = "Fats"
        static let Proteins = "Proteins"
        static let Calories = "Calories"
//        static let aCalories = "aCalories"
//        static let eCalories = "eCalories"
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
        self.actCalories = ((Float(Kcals))*(Float(Gram)/100.00))
        self.expCalories = Float((Carbs*4)+(Fats*9)+(Proteins*4)*((Gram/100)))
        print("Total Cals: \(self.actCalories)")
        print("Expected Calories is \(self.expCalories)")
        

    }//end initialisation
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(LogTime, forKey: PropertyKey.Time)
        aCoder.encode(gramSize, forKey: PropertyKey.Size)
        aCoder.encode(foodName, forKey: PropertyKey.Name)
        aCoder.encode(foodPhoto, forKey: PropertyKey.Photo)
        aCoder.encode(foodCarbs, forKey: PropertyKey.Carbs)
        aCoder.encode(foodFats, forKey: PropertyKey.Fats)
        aCoder.encode(foodProteins, forKey: PropertyKey.Proteins)
        aCoder.encode(foodCalories, forKey: PropertyKey.Calories)
//        aCoder.encode(actCalories, forKey: PropertyKey.aCalories)
//        aCoder.encode(expCalories, forKey: PropertyKey.eCalories)

    }
    
/*required modifier dictates this initializer must be implemented on every subclass.
convenience modifier states that this is a secondary initializer.*/
    required convenience init?(coder aDecoder: NSCoder)
    {
        //test decoding on the fooditem name, if this fails the whole decode process will fail
        //also unwraps the optional returned and downcasts to string
        guard let Name = aDecoder.decodeObject(forKey: PropertyKey.Name) as? String else
        {
            os_log("Decode Failed", log: OSLog.default, type: .debug)
            return nil
        }
        
        //String downcast required..
        let Time = aDecoder.decodeObject(forKey: PropertyKey.Time) as? String
        
        //downcast returned value by decodeObject() to type UIImage, which is a conditional anyway so there is no issue if nil is returned.
        let Photo = aDecoder.decodeObject(forKey: PropertyKey.Photo) as? UIImage
        
        
        //Decode Integer returns, not downcasting required as integer returned by decodeInteger()
        let Carbs = aDecoder.decodeInteger(forKey: PropertyKey.Carbs)
        let Fats = aDecoder.decodeInteger(forKey: PropertyKey.Fats)
        let Proteins = aDecoder.decodeInteger(forKey: PropertyKey.Proteins)
        let Calories = aDecoder.decodeInteger(forKey: PropertyKey.Calories)
//        let eCalories = aDecoder.decodeInteger(forKey: PropertyKey.eCalories)
//        let aCalories = aDecoder.decodeInteger(forKey: PropertyKey.aCalories)
        let Size = aDecoder.decodeInteger(forKey: PropertyKey.Size)

        
        //Initiliase the decoded data into the object
        self.init(Time:Time!, Gram: Size, Name: Name, Photo: Photo, Carbs: Carbs, Fats: Fats, Proteins: Proteins, Kcals: Calories)
    }
    
} //end class specifier


