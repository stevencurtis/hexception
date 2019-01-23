//
//  HexGameLogic.swift
//  Hexception
//
//  Created by Steven Curtis on 23/01/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class HexGameLogic {
    
    
    
    // custom function to generate a random UIColor
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}
