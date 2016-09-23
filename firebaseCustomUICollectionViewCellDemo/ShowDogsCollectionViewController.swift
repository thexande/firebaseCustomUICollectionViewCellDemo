//
//  ShowDogsCollectionViewController.swift
//  firebaseCustomUICollectionViewCellDemo
//
//  Created by Alexander Murphy on 9/22/16.
//  Copyright © 2016 Alexander Murphy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabaseUI
private let reuseIdentifier = "Cell"

class ShowDogsCollectionViewController: UICollectionViewController {
    
    let firebaseRef = FIRDatabase.database().reference().child("dogs")
    var dataSource: FirebaseCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = FirebaseCollectionViewDataSource(ref: self.firebaseRef, cellClass: DogCollectionViewCell.self, cellReuseIdentifier: reuseIdentifier, view: self.collectionView!)
        
        self.dataSource.populateCell { (cell: UICollectionViewCell, obj: NSObject) -> Void in
            let snap = obj as! FIRDataSnapshot
            let dogCell = cell as! DogCollectionViewCell
            
            dogCell.backgroundColor = UIColor.green
            dogCell.dogName.text = "alex"
            
            
            
            print(snap.childSnapshot(forPath: "name"))
            
          // The line below should set the label text for one of the labels on our custom UICollectionCell Class, however it unwraps to nil.
          // fatal error: unexpectedly found nil while unwrapping an Optional value
          // dogCell.dogAge.text = "woot"
        
        }
        self.collectionView?.dataSource = self.dataSource
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
