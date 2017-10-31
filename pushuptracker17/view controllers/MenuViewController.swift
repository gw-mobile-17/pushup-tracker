//
//  ViewController.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 10/16/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view did appear")
        
        let record = Persistance.sharedInstance.fetchBestWorkout()?.pushupsCompleted ?? 0
        recordLabel.text = "Pushup Record: \(record)"
    }
    
    @IBAction func trackButtonPressed(_ sender: Any) {
        print("track pushups pressed")
        
        performSegue(withIdentifier: "pushUpSegue", sender: self)
    }
    
}

