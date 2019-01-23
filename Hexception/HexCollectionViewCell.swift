//
//  HexCollectionViewCell.swift
//  Hexception
//
//  Created by Steven Curtis on 23/01/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class HexCollectionViewCell: UICollectionViewCell {
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.alpha = 0.1
            }
            // remains hidden, even if the incorrect answer is chosen
            
        }
    }
    func deselect(){
        self.isHidden = false
    }
    
}
