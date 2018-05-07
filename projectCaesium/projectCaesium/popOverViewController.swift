//  popOverViewController.swift
//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//  Implement a cool pop up window for more information.

import UIKit

class popOverViewController: UIViewController {

//    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
//        createGradientLayer()
    }
    
//    func createGradientLayer()
//    {
//        gradientLayer = CAGradientLayer()
//
//        gradientLayer.frame = self.view.bounds
//
//        gradientLayer.colors = [UIColor(named: "G1")?.cgColor, UIColor(named: "G2")?.cgColor]
//
//        self.view.layer.addSublayer(gradientLayer)
//    }
}
