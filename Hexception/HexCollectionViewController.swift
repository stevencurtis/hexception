//
//  HexCollectionViewController.swift
//  Hexception
//
//  Created by Steven Curtis on 23/01/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

protocol CollectionViewProtocol {
    func checkClick(answer:UIColor)
}

private let reuseIdentifier = "Cell"

class HexCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
private let reuseIdentifier = "HexCell"
    
    var correctColor : UIColor?
    var colors = [UIColor]()
    var cellCount = 3
    var cellWidth : CGFloat = 100
    var cellSpacing = 1
    
    var parentVC: CollectionViewProtocol?
    
    func setupGame(correctColor : UIColor, colors: [UIColor], cellCount: Int, cellWidth: CGFloat) {
        guard colors.count == cellCount else {
            fatalError("insuffient colours provided")
        }
        self.correctColor = correctColor
        self.colors = colors
        self.cellCount = cellCount
        
        let rawCellWidth = (cellWidth / CGFloat( cellCount % 2 == 1 ? cellCount + 1 : cellCount) ) * (self.collectionView.frame.size.height * 1.0) / 100
        
        if rawCellWidth > 120 {
            self.cellWidth = 120
        } else
        if rawCellWidth < 30 {
            self.cellWidth = 30
        } else  {
            self.cellWidth = rawCellWidth
        }
        

        print (self.cellWidth)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(HexCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // change cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let cellSpacing: CGFloat = flowLayout.minimumInteritemSpacing
        let cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
        var collectionWidth = collectionView.frame.size.width
        if #available(iOS 11.0, *) {
            collectionWidth -= collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
        }
        let totalWidth = cellWidth * cellCount + cellSpacing * (cellCount - 1)
        if totalWidth <= collectionWidth {
            let edgeInset = (collectionWidth - totalWidth) / 2
            return UIEdgeInsets(top: flowLayout.sectionInset.top, left: edgeInset, bottom: flowLayout.sectionInset.bottom, right: edgeInset)
        } else {
            return flowLayout.sectionInset
        }
    }
    
    func resetGame() {
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            parentVC!.checkClick(answer: cell.backgroundColor!)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as UICollectionViewCell
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }

}
