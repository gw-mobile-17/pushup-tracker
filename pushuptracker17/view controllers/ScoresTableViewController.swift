//
//  ScoresTableViewController.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 11/6/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit

class ScoresTableViewController: UITableViewController {
    
    var workouts:[Workout]!

    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // implementation, return the number of rows
        return workouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text =
            "\(workouts[indexPath.row].pushupsCompleted)"

        return cell
    }
}
