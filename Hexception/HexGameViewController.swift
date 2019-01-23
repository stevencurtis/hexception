//
//  HexGameViewController.swift
//  Hexception
//
//  Created by Steven Curtis on 23/01/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class HexGameViewController: UIViewController, CollectionViewProtocol {
    
    @IBOutlet weak var initialLevel: UIButton!
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    // HexCollection within containerView
    @IBOutlet weak var containerView: UIView!
    var gameCollection: HexCollectionViewController?
    let gameLogic = GameLogic()
    var correctGameColour : UIColor?
    var currentLevelButton : UIButton?
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        setupNewGame()
    }
    
    func checkClick(answer: UIColor) {
        // if wrong try again. That colour was...
        if (answer == correctGameColour) {
            hexLabel.textColor = correctGameColour
            newGameButton.isHidden = false
            let strNumber: NSString = "Correct!" as NSString
            let range = (strNumber).range(of: strNumber.description)
            let attribute = NSMutableAttributedString.init(string: strNumber.description )
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range)
            feedbackLabel.attributedText = attribute
            feedbackLabel.isHidden = true
            newGameButton.isHidden = false
            newGameButton.titleLabel?.text = "Correct! Click for a new game"
        } else {
            let strNumber: NSString = "Wrong. That colour was " + answer.hexString as NSString
            let range = (strNumber).range(of: answer.hexString)
            let attribute = NSMutableAttributedString.init(string: strNumber.description )
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: answer , range: range)
            feedbackLabel.attributedText = attribute
        }
    }
    
    @IBAction func selectNumber(_ sender: UIButton) {
        setupNewGame(sender.tag)
        currentLevelButton?.isEnabled = true
        sender.isEnabled = false
        currentLevelButton = sender
    }

    
    func setupNewGame(_ choices: Int? = 3) {
        feedbackLabel.text = "Click on the colour."
        feedbackLabel.isHidden = false
        newGameButton.isHidden = true
        
        let colors = gameLogic.generateColorArray(number: choices!)
        let correctColor = gameLogic.pickAnswerFrom(colorArray: colors)
        correctGameColour = correctColor
        hexLabel.text = correctColor.hexString
        gameCollection?.setupGame(correctColor: correctColor, colors: colors, cellCount: choices!, cellWidth: 100)
        gameCollection?.resetGame()
        hexLabel.textColor = UIColor.black
        newGameButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevelButton = initialLevel
        setupNewGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hexCollection" {
            let view = segue.destination as? HexCollectionViewController
            gameCollection = view
            view!.parentVC = self
            setupNewGame()
            
        }
    }
    
    
}
