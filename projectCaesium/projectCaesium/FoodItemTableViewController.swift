//
//  FoodItemTableViewController.swift
//  123
//
//  Created by Stephen Alger on 23/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit
import os.log

class FoodItemTableViewController: UITableViewController {

    //MARK: Properties
    
    //create array of objects of class type: foodItem
    var foodItems = [FoodItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavBar()
        
        //Manually add an edit button with the required abilities pre-baked!
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedMeals = loadEntries() {
            foodItems += savedMeals
        }
        
        else {
            // Load our sample data
            loadSampleFoods()
        }
    }
    
    //MARK: Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        //Creating a switch statement which deals with the two kinds of segues which will be encountered when using the same scene for two separate purposes... In the first case we wish to add new food items, in the second we want to edit food items. To handle these similar activities we will have to make slight adjustments to the scene based on the activity we wish to carry out
        switch(segue.identifier ?? "")
        {
        
        //in the case the segue identifier states we want to add items...
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
           
        //Show item details
        case "ShowDetail":
            //constant takes the users aimed destination
            guard let FoodAddOrEditViewController = segue.destination as? AddFoodViewController
            else
            {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            //save the sending table cell so we can display the corresponding food item details
            guard let selectedItemCell = sender as? FoodItemTableViewCell
            else
            {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            //save the index path of the given cell
            guard let indexPath = tableView.indexPath(for: selectedItemCell)
            else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            //take in object selected
            let selectedItem = foodItems[indexPath.row]
            FoodAddOrEditViewController.newFoodItem = selectedItem
            
        //default case - will never get here...hopefully!
        default:
            fatalError("Invalid Segue Identifier Calling: \(String(describing: segue.identifier))")
        }
    }
    
    //adopt ios11 nav bar effect
    func setupNavBar()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Add support for table view editing
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            //Delete selected row from the array of food objects
            foodItems.remove(at: indexPath.row)
            
            //save object array
            saveEntry()
            
            //Remove this corresponding row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } //end if
        
        else if editingStyle == .insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }//end else
    }//end tableView editing method()
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        //alert the table view controller to only display one section.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return a single row for every food object in the 'foodItems' array.
        return foodItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FoodItemTableViewCell"
        
        //We perform a downcasting on the returned object from the UITableViewCell class to our FoodItemTableViewCell by using 'as?'. We then use the 'guard let' expression to safely unwrap the optional just returned.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FoodItemTableViewCell  else {
            fatalError("The dequeued cell is not an instance of FoodItemTableViewCell.")
        }
        
        //Get the corresponding foodItem for the data source layout.
        let foodItem = foodItems[indexPath.row]
        


        
        cell.nameLabel.text = foodItem.foodName
        cell.cellImage.image = foodItem.foodPhoto
        cell.kcalLabel.text =   "Kcals: \(String(format: "%.0f", foodItem.actCalories))"
        cell.carbLabel.text = "Car: \(String(format: "%.0f", foodItem.foodCarbs))g"
        cell.proteinLabel.text = "Pro: \(String(format: "%.0f", foodItem.foodProteins))g"
        cell.fatLabel.text = "Fat: \(String(format: "%.0f", foodItem.foodFats))g"
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("dd/MM/yy")
        //let Time = formatter.string(from: Date())
        
        cell.dateLabel.text = "\(formatter.string(from: foodItem.LogTime))"
        
        Count.kcalCounter += foodItem.actCalories
        print("KC: \(Count.kcalCounter)")
        return cell
    }
    
    
 
    //MARK: Actions
    //dealing with unwinding from Add Food View to Food Table View
    //I.E. We are moving from adding/ editing back to the table view - we need to save our food entry
    @IBAction func unwindToFoodItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddFoodViewController, let food = sourceViewController.newFoodItem
        {
            
            
            //check if a row was selected in the index path, if so then we are dealing with an edit
            if let selectedIndexPath = tableView.indexPathForSelectedRow
            {
                //In this case we update the food entry at this given path with the user's input and reload the table view
                foodItems[selectedIndexPath.row] = food
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            //otherwise we are dealing with a basic new food item entry
            else
            {
                // Add a new foodItem.
                let newIndexPath = IndexPath(row: foodItems.count, section: 0)
                
                //add this food item to the food array
                foodItems.append(food)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            //save the foodItems array
            saveEntry()
        }
    }
    
    //MARK: Private Methods
    
    //method to save each entry
    private func saveEntry()
    {
        //save the foodItems array to memory... if return is true we have success
        let saved = NSKeyedArchiver.archiveRootObject(foodItems, toFile: FoodItem.ArchiveURL.path)
        if saved
        {
            os_log("Entry saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to Save Entry...", log: OSLog.default, type: .error)
        }
    }
    
    //Method returns either nil or an array of FoodItem objects
    private func loadEntries() -> [FoodItem]?
    {
        //return object from memory location and downcast to an array of FoodItem objects
        return NSKeyedUnarchiver.unarchiveObject(withFile: FoodItem.ArchiveURL.path) as? [FoodItem]
    }
    
    private func loadSampleFoods()
    {
        
        //load in food images
        let photo1 = UIImage(named: "Sample1")
        let photo2 = UIImage(named: "Sample2")
        let photo3 = UIImage(named: "Sample3")
        let photo4 = UIImage(named: "Sample4")
        let photo5 = UIImage(named: "Sample5")
        
        //create sample date
        let calendar = Calendar.current
        
        var components = DateComponents()
        
        components.day = 30
        components.month = 4
        components.year = 2018
        components.hour = 15
        components.minute = 15
        
        let newDate = calendar.date(from: components)
        
        guard let foodOne = FoodItem(Time: newDate!, Gram: 100.00, Name: "Crisps & Dip", Photo: photo1, Carbs: 30.02, Fats: 15.05, Proteins: 5.1, Kcals: 200) else {
            fatalError("Unable to instantiate foodOne")
        }


        guard let foodTwo = FoodItem(Time: newDate!, Gram: 300.00, Name: "Burger", Photo: photo2, Carbs: 5.1, Fats: 29.9, Proteins: 24.4, Kcals: 377) else {
            fatalError("Unable to instantiate foodTwo")
        }

        guard let foodThree = FoodItem(Time: newDate!, Gram: 50.00, Name: "Caesar Salad", Photo: photo3, Carbs: 6.9, Fats: 8.9, Proteins: 10.1, Kcals: 205) else {
            fatalError("Unable to instantiate foodThree")
        }

        guard let foodFour = FoodItem(Time: newDate!, Gram: 500.00, Name: "Pepper Steak", Photo: photo4, Carbs: 5.2, Fats: 29.3, Proteins: 24.4, Kcals: 377) else {
            fatalError("Unable to instantiate foodFour")
        }

        guard let foodFive = FoodItem(Time: newDate!, Gram: 50.00, Name: "Mixed Fruit Dessert", Photo: photo5, Carbs: 30, Fats: 0, Proteins: 3, Kcals: 132) else {
            fatalError("Unable to instantiate foodFive")
        }
        
        
        
        foodItems += [foodOne, foodTwo, foodThree, foodFour, foodFive]
        
    } //end loadsample()
    
    
    

}
