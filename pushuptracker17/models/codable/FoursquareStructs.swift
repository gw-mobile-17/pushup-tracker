//
//  FoursquareStructs.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 11/20/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation

//generated using http://danieltmbr.github.io/JsonCodeGenerator/
struct Root: Codable {
    let response: Response
}

struct Response: Codable {
    let venues: [Venues]
}

struct Venues: Codable {
    let name: String
    let location: Location
}

struct Location: Codable {
    let formattedAddress: [String]
}
