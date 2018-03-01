//
//  ViewController.swift
//  CollectionView
//
//  Created by Alex Voronov on 01.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = String(indexPath.row)
        cell.label.textColor = UIColor.white
        cell.backgroundColor = UIColor.orange
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: (100 + indexPath.row), height: (100 + indexPath.row))
        
        return size
    }
    

}
