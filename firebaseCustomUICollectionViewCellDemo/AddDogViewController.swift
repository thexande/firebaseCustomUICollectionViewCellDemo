//
//  AddDogViewController.swift
//  firebaseCustomUICollectionViewCellDemo
//
//  Created by Alexander Murphy on 9/22/16.
//  Copyright © 2016 Alexander Murphy. All rights reserved.
//

import UIKit
import Firebase

class AddDogViewController: UIViewController {
    let firebaseRootRef = FIRDatabase.database().reference()
    
    @IBOutlet weak var dogName: UITextField!
    @IBOutlet weak var dogAge: UITextField!
    @IBOutlet weak var favoriteToy: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelBtn(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: AnyObject) {
        // gather dog data and create dog
        let age: String = dogAge.text as String!
        let name: String = dogName.text as String!
        let favorite_toy: String = favoriteToy.text as String!
        
        let key = firebaseRootRef.child("dogs").childByAutoId().key
        let dog = [
            "name": name,
            "age": age,
            "favorite_toy": favorite_toy
        ]
        // update dog in firebase
        let childUpdates = ["/dogs/\(key)" : dog]
        firebaseRootRef.updateChildValues(childUpdates)
        // dismiss view
        self.dismiss(animated: true, completion: nil)
    }

}
