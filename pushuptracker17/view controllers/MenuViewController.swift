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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let record = Persistance.sharedInstance.fetchBestWorkout()?.pushupsCompleted ?? 0
        recordLabel.text = "Pushup Record: \(record)"
    }
    
    @IBAction func trackButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "pushUpSegue", sender: self)
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let pushupRecord = Persistance.sharedInstance.fetchBestWorkout()?.pushupsCompleted ?? 0
        
        let textToShare = "Check out my push up record: \(pushupRecord)!"
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scoresSegue" {
            let workouts = Persistance.sharedInstance.fetchWorkouts()
            
            let destinationViewController = segue.destination as? ScoresTableViewController
            destinationViewController?.workouts = workouts.sorted(by: { $0.pushupsCompleted > $1.pushupsCompleted })
        }
    }
    
}

