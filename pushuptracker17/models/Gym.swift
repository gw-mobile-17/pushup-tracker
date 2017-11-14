//
//  Gym.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 11/13/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation

struct Gym: Decodable {
    let name: String
    let address: String
    let logoUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case name //this matches above
        case address //this matches above
        case logoUrlString = "image_url"
    }
}
