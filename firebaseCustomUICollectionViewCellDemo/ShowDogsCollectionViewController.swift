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
        
        self.dataSource = FirebaseCollectionViewDataSource(ref: self.firebaseRef, prototypeReuseIdentifier: reuseIdentifier, view: self.collectionView!)
        
        self.dataSource.populateCell { (cell: UICollectionViewCell, obj: NSObject) -> Void in
            let snap = obj as! FIRDataSnapshot
            let dogCell = cell as! DogCollectionViewCell
            dogCell.backgroundColor = UIColor.green
            
            // name
            let nameSnap = snap.childSnapshot(forPath: "name")
            dogCell.dogName.text = nameSnap.value! as? String
            // favorite toy
            let toySnap = snap.childSnapshot(forPath: "favorite_toy")
            dogCell.dogToy.text = toySnap.value! as? String
            // dog age
            let ageSnap = snap.childSnapshot(forPath: "age")
            dogCell.dogAge.text = ageSnap.value! as? String
            
        }
        self.collectionView?.dataSource = self.dataSource
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
