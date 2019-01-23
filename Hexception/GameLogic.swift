//
//  GameLogic.swift
//  Hexception
//
//  Created by Steven Curtis on 23/01/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class GameLogic {
    
    func setupGame(number: Int) -> (correctAnswer: UIColor, colorsArray: [UIColor]) {
        let colours = generateColorArray(number: number)
        let correctColor = pickAnswerFrom(colorArray: colours)
        return (correctColor, colours)
    }
    
    func pickAnswerFrom(colorArray: [UIColor]) -> UIColor {
        return colorArray[random(maxValue: colorArray.count)]
    }
    
    // all colors must be unique within the array
    func generateColorArray(number: Int) -> [UIColor] {
        var colors = [UIColor]()
        for _ in 1...number {
            var color : UIColor
            repeat {
                color = randomColor()
            } while colors.contains(color)
            colors.append(color)
        }
        return colors
    }
}
