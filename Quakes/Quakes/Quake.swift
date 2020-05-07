//
//  Quake.swift
//  QuakesTests
//
//  Created by Tobi Kuyoro on 07/05/2020.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

// Conforming to MKAnnotation requires a NSObject subclass
class Quake: NSObject, Decodable {
    let magnitude: Double
    let time: Date
    let place: String
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
    }

    required init(from decoder: Decoder) throws {
        // Containers to pull out data

        // Extract properties
        self.magnitude = 0
        self.time = Date()
        self.place = ""
        self.latitude = 0
        self.longitude = 0

        super.init()
    }
}
