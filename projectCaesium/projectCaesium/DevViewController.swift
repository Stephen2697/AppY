//
//  DevViewController.swift
//  123
//
//  Created by Stephen Alger on 26/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit

class DevViewController: UIViewController {

    @IBAction func getTimeBTN(_ sender: UIButton)
    {
        getTime()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavBar()

        // Do any additional setup after loading the view.
    }
    
    func getTime()
    {
        var enterString: String = ""
        
        
        //create instance of TimeX
        let instTime = TimeX.init(enter: enterString)
        
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
