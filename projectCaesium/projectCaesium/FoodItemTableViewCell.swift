//  FoodItemTableViewCell.swift
//  Created by Stephen Alger
//  Copyright © 2018 Stephen Alger. All rights reserved.
//  Custom Table Cell View which inherits from the UITableViewCell Class
//  Here each cell is formatted to display appropriate macronutrient information

import UIKit

class FoodItemTableViewCell: UITableViewCell {

    //MARK: Properties


    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var kcalLabel: UILabel!
    
    @IBOutlet weak var carbLabel: UILabel!

    @IBOutlet weak var proteinLabel: UILabel!
    
    @IBOutlet weak var fatLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
