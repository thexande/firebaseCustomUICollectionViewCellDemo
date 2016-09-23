//  AddDogViewController.swift

import UIKit
import Firebase

class AddDogViewController: UIViewController {
    let firebaseRootRef = FIRDatabase.database().reference()
    
    @IBOutlet weak var dogName: UITextField!
    @IBOutlet weak var dogAge: UITextField!
    @IBOutlet weak var favoriteToy: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
