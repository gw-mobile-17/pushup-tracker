//
//  PushUpViewController.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 10/23/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit

class PushUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var counterLabel: UILabel!
    
    private var counter = 0 {
        didSet {
            counterLabel.text = String(counter)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        let numPushups = counter
        let name = nameTextField.text!
        let date = Date()
        
        let workout = Workout(name: name, pushupsCompleted: numPushups, startDate: date)
        
        Persistance.sharedInstance.saveWorkout(workout)
        
        counter = 0
    }
    
    @IBAction func noseButtonPressed(_ sender: Any) {
        counter += 1
    }
}

extension PushUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("range \(range.location) string \(string)")
        
        return true
    }
}
