//
//  DashViewController.swift
//  123
//
//  Created by Stephen Alger on 30/04/2018.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit
import Charts

class DashViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    var arrayWithoutData = [FoodItem]()
    
    var carbDataEntry = PieChartDataEntry(value: 0)
    var fatDataEntry = PieChartDataEntry(value: 0)
    var proteinDataEntry = PieChartDataEntry(value: 0)
    //let relativeDivisor = (Count.carbCounter + Count.fatCounter + Count.proteinCounter)
    
    var macroRatioDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //access, decode and count macros in foodItems array
        countMacros()
        
        setupNavBar()
        // Do any additional setup after loading the view.
        
        
        
        
        pieChart.chartDescription?.text = ""
        
        
        carbDataEntry.value = Double(Count.carbCounter)
        carbDataEntry.label = "% Fats"
        
        fatDataEntry.value = Double(Count.fatCounter)
        fatDataEntry.label = "% Carbs"
        
        proteinDataEntry.value = Double(Count.proteinCounter)
        proteinDataEntry.label = "% Protein"
        
        macroRatioDataEntries = [fatDataEntry, carbDataEntry, proteinDataEntry]
        
        updateChartData()
        
        pieChart.drawEntryLabelsEnabled = true
        pieChart.drawHoleEnabled = true
        pieChart.usePercentValuesEnabled = true
        pieChart.layer.cornerRadius = 10
        pieChart.layer.backgroundColor = UIColor.darkGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //adopt ios11 nav bar effect
    func setupNavBar()
    {
        navigationItem.title = "Kcals: \(String(format: "%.0f", Count.kcalCounter))"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(values: macroRatioDataEntries, label: nil)
        
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"Fat"), UIColor(named:"Carb"), UIColor(named:"Protein")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
        
    }
    
    //Method returns either nil or an array of FoodItem objects
    private func loadEntries() -> [FoodItem]?
    {
        //return object from memory location and downcast to an array of FoodItem objects
        return NSKeyedUnarchiver.unarchiveObject(withFile: FoodItem.ArchiveURL.path) as? [FoodItem]
    }
    
    func countMacros()
    {
        Count.kcalCounter = 0
        Count.carbCounter = 0
        Count.fatCounter = 0
        Count.proteinCounter = 0
        
        let foodItems = loadEntries()
        
        for foodItem in foodItems!
        {
            
            let relativeSize = (foodItem.gramSize/100.00)
            
            Count.kcalCounter += foodItem.actCalories
            Count.carbCounter += foodItem.foodCarbs*relativeSize
            Count.fatCounter += foodItem.foodFats*relativeSize
            Count.proteinCounter += foodItem.foodProteins*relativeSize
        }
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
