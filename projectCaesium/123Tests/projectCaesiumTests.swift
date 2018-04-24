//
//  _23Tests.swift
//  123Tests
//
//  Created by Stephen Alger on 13/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import XCTest
@testable import _23

class _23Tests: XCTestCase {
    
    func testInit()
    {
    
        let FoodTest = FoodItem.init(Time: "2000", Gram: 100, Name: "Test Food", Photo: nil , Carbs: 123, Fats: 123, Proteins: 123, Kcals: 123)
    }
}
