//
//  custom.swift
//  123
//
//  Created by Stephen Alger on 03/05/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class custom: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        layer.borderWidth = 0.25
        layer.borderColor = UIColor(named: "redTheme")?.cgColor
        layer.cornerRadius = 5
        clipsToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        
    }


}
