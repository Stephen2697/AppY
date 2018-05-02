//
//  DevViewController.swift
//  123
//
//  Created by Stephen Alger on 26/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class DevViewController: UIViewController {
    
    
    
    @IBOutlet weak var popOver: UIView!
    
    
    
    @IBOutlet weak var txtFieldOne: UILabel!
    @IBOutlet weak var txtFieldTwo: UILabel!
    
    @IBAction func BTN(_ sender: UIBarButtonItem)
    {
        popOver.isHidden = !popOver.isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popOver.isHidden = true
        
        txtFieldOne.layer.borderWidth = 0.5
        txtFieldOne.layer.borderColor = UIColor(named: "redTheme")?.cgColor
        txtFieldOne.layer.cornerRadius = 10
        
        txtFieldTwo.layer.borderWidth = 0.5
        txtFieldTwo.layer.borderColor = UIColor(named: "redTheme")?.cgColor
        txtFieldTwo.layer.cornerRadius = 20
        
        
        popOver.layer.borderWidth = 1
        popOver.layer.borderColor = UIColor(named: "redTheme")?.cgColor

        popOver.layer.cornerRadius = 10
        popOver.layer.borderWidth = 0.5
        popOver.layer.borderColor = UIColor(named: "redTheme")?.cgColor
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //configure ios11 style nav bar with preferLargeTitles boolean attribute setu to true
    func setupNavBar()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
