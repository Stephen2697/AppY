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
    
    
    
    init? (today: String)
    {
        
        self.today = getTodayString()
        print("Date string: \(self.today)")
        
    }
    
    
    
    func getTodayString() -> String
    {
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
    

    
    
}






