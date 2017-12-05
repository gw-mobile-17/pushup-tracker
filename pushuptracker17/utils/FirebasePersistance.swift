//
//  FirebasePersistance.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 12/4/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation
import Firebase

class FirebasePersistance {
    static let sharedInstance = FirebasePersistance()
    
    func saveWorkout(_ workout: Workout) {
        let firestore = Firestore.firestore()
        
        var documentReference: DocumentReference? = nil
        documentReference = firestore.collection("workouts").addDocument(data:
            [
                "name": workout.name,
                "pushupsCompleted": workout.pushupsCompleted,
                "startDate": workout.startDate
        ]) { error in
            //handle result
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("save success with id \(documentReference!.documentID)")
            }
        }
        
    }
    
    func fetchWorkouts() {
        let firestore = Firestore.firestore()
        
        firestore.collection("workouts").getDocuments { (querySnapshot, error) in
            //handle the result
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    print(document.data())
                }
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
}
