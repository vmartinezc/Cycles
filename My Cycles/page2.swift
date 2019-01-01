//
//  page2.swift
//  My Cycles
//
//  Created by Valeria Martinez on 5/10/18.
//  Copyright © 2018 Valeria Martinez. All rights reserved.
//

import UIKit

class page2: UIViewController {

    @IBOutlet weak var textField: UITextView!
     var textFieldtxt = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(firstColor: Colors.lightblue, secondColor: Colors.blueblue)
        textField.text = textFieldtxt
        
        
       
        
        
    }



}
