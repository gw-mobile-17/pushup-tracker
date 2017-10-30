//
//  ViewController.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 10/16/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load!")
        
        //pushUpRecord.text = "Pushup Record: 50"
    }
    
    @IBAction func trackButtonPressed(_ sender: Any) {
        print("track pushups pressed")
        
        performSegue(withIdentifier: "pushUpSegue", sender: self)
    }
    
}

