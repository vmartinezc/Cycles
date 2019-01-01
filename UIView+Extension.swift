//
//  UIView+Extension.swift
//  My Cycles
//  Created by Valeria Martinez on 5/10/18.
// This extension allows for a gradient background
//  Copyright © 2018 Valeria Martinez. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setGradientBackground(firstColor : UIColor, secondColor: UIColor){
        let gradientLayer = CAGradientLayer() //the CAGradientLayer allows a color gradient over its background color
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.0, 1.0] //diagonal gradient
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
