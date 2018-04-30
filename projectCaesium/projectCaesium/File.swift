//
//  File.swift
//  123
//
//  Created by Stephen Alger on 19/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//  Testing date obtaining code

import Foundation

class TimeX {
    var today : String!
    
    
    
    init? (enter: String)
    {
        
        getTodayString()
        
        
    }
    
    
    
    func getTodayString()
    {
        //get date
        let date: Date = Date()
        
        //format date
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let todayArray = ["Year": components.year, "Month": components.month, "Day": components.day, "Hour": components.hour, "Minute": components.minute, "Second": components.second]
        
    }
    
    
    
    

    
    
}






