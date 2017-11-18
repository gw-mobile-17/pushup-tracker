//
//  GymFinder.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 11/13/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation

protocol NearbyGymDelegate {
    func gymsFound(gyms: [Gym])
    func gymsNotFound()
}

class GymFinder {
    
    var delegate: NearbyGymDelegate?
    
    func fetchNearbyGyms() {
        //create url request
        let requestURL = URL(string: "https://s3.amazonaws.com/files.jared-alexander.com/fake_gym_data/gymdata.json")!
        let urlRequest = URLRequest(url: requestURL)
        
        //create network request ("dataTask") and define callback behavior
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            //this code will execute upon completion of the network request
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 { //200 = success
                if let data = data, let gymJsonArray = try? JSONSerialization.jsonObject(with: data, options: []) {
                    
                    if let gymJsonArray = gymJsonArray as? [[String:Any]] { //json data is an array of dictionaries
                        var gyms = [Gym]()
                        
                        //convert json data to our model object
                        for gymJsonObject in gymJsonArray {
                            let gymName = gymJsonObject["name"] as? String ?? ""
                            let gymAddress = gymJsonObject["address"] as? String ?? ""
                            let gymImageUrl = gymJsonObject["image_url"] as? String ?? ""
                            
                            let gym = Gym(name: gymName, address: gymAddress, logoUrlString: gymImageUrl)
                            gyms.append(gym)
                        }
                        
                        self.delegate?.gymsFound(gyms: gyms)
                    }
                    else {
                        self.delegate?.gymsNotFound()
                    }
                }
                else {
                    self.delegate?.gymsNotFound()
                }
            }
            else {
                self.delegate?.gymsNotFound()
            }
        }
        
        task.resume()
    }
    
    //TODO in class soon: utilize this code for decoding JSON into our model object (instead of using codea above)
    private func gymsFromJsonData(data: Data) -> [Gym] {
        let decoder = JSONDecoder()
        let gyms = try? decoder.decode([Gym].self, from: data)
        
        return gyms ?? [Gym]()
    }
}
