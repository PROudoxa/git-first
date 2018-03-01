//
//  BottomMenu.swift
//  CollectionViewMenu
//
//  Created by Alex Voronov on 01.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class BottomMenu: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var menuIsActive = false
    let cellId = "Cell"
    let cellHeight: CGFloat = 50
    let array = ["first line", "second line", "third line"]
    var cvHeight: CGFloat {
        return CGFloat(array.count) * cellHeight + 1 * CGFloat(array.count)
    }
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .clear
        return cv
    }()
    
    func toggleMenu() {
        menuIsActive = !menuIsActive
        
        if let window = UIApplication.shared.keyWindow {
            if menuIsActive {
                
                window.addSubview(collectionView)
                
                collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: cvHeight)
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.collectionView.frame = CGRect(x: 0, y: window.frame.height - self.cvHeight, width: window.frame.width, height: self.cvHeight)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.cvHeight)
                }, completion: nil)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        cell.label.text = array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item: \(indexPath.row): \(array[indexPath.row])")
    }
    
    override init() {
        super.init()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
