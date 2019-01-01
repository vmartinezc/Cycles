//
//  ViewController.swift
//  My Cycles
//  Created by Valeria Martinez on 5/5/18.
// for CS 214 @ CALVIN COLLEGE
//  Copyright © 2018 Valeria Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// IBOutlets: Interface builders for the labels/buttons to the code
    @IBOutlet weak var myCyclesStart: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var averagePeriod: UITextField!
    @IBOutlet weak var averageLength: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var lastPeriod: UITextField!
    private var datePicker: UIDatePicker?
    var convertedCalculatedPeriod = ""
    var convertedOvulation = ""
    var convertedFertileWindow = ""
    
    override func viewDidLoad() {
    super.viewDidLoad()
//labels and buttons
    myCyclesStart.text = "My Cycles"
    myCyclesStart.textColor = UIColor.black
    startButton.setTitle("Start", for:.normal)
    averagePeriod.placeholder = "Average period length: "
    averageLength.placeholder = "Average cycle length: "
    userName.placeholder = "Enter name: "
    lastPeriod.placeholder = "Last period date: "
    
        
        
// date picker for lastPeriod
    datePicker = UIDatePicker()
    datePicker?.datePickerMode = .date //sets the format
    datePicker?.addTarget(self,action:
        #selector(ViewController.dateChanged(datePicker:)),for: .valueChanged)
    lastPeriod.inputView = datePicker //configure into the view for lastPeriod
      
        let userTap = UITapGestureRecognizer(target: self, action:
            #selector(ViewController.bgTapped(gestureRecognizer:)))
        view.addGestureRecognizer(userTap)

// setGradientBackground and Colors are extensions I created for myCycles
    view.setGradientBackground(firstColor: Colors.lightgray, secondColor: Colors.gray)


    }

    
/* bgTapped()
* @param: gestureRecognizer, a UITapGestureRecoginzer
* returns: nothing
* If the user taps on any part of the background, the datepicker keyboard will close
*/
    @objc func bgTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
        
    }
    
/* dateChanged()
* @param: datePicker, a UIDatePicker
* returns: nothing
* Changes the user selection of dates to the format "MM/DD/YYYY
*/
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        lastPeriod.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
/* prepare()
* @param: segue: UIStoryboardSegue, sender
* prepares the code that needs to be done right before the segue
* from viewController to page2 (from first storyboard to the other)
*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //calendar object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let datePeriod = dateFormatter.date(from: lastPeriod.text!)
        // print(datePeriod)
        
        let calendar = NSCalendar.current
        let daysAdd = Int(averageLength.text!)
        let ovulationDays = Int(daysAdd!/2)
        let fertileDays = Int(ovulationDays-5)
        let newDateComponents = NSDateComponents()
        newDateComponents.day = daysAdd!
        let newDateComponents2 = NSDateComponents()
        newDateComponents2.day = ovulationDays
        let newDateComponents3 = NSDateComponents()
        newDateComponents3.day = fertileDays
        
    
        let calculatedPeriod = calendar.date(byAdding: newDateComponents as DateComponents, to:datePeriod!)
        convertedCalculatedPeriod = dateFormatter.string(from: calculatedPeriod!)
        
        let calculatedOvulation = calendar.date(byAdding: newDateComponents2 as DateComponents, to:datePeriod!)
        convertedOvulation = dateFormatter.string(from: calculatedOvulation!)
        
        let calculatedFertile = calendar.date(byAdding: newDateComponents3 as DateComponents, to:datePeriod!)
        convertedFertileWindow = dateFormatter.string(from: calculatedFertile!)
        
        
    
        let destViewController: page2 = segue.destination as! page2
        destViewController.textFieldtxt = "Hello, \(userName.text!)!\n \n \n Your average period duration: \(averagePeriod.text!) days \n Your average cycle length: \(averageLength.text!) days \n Next period date: \(convertedCalculatedPeriod)  \n Next ovulation date: \(convertedOvulation) \n Next fertile window starts: \(convertedFertileWindow) "
    }
    
    
//what should happen when the start button is pressed
    
    @IBAction func startButtonPressed(_ sender: Any) {

    }

}

