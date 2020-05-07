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
    let magnitude: Double?
    let time: Date
    let place: String
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case place
        case time
        case latitude
        case longitude

        case properties
        case geometry
        case coordinates
    }

    required init(from decoder: Decoder) throws {
        // Containers to pull out data
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let properties = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .properties)
        let geometry = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
        var coordinates = try geometry.nestedUnkeyedContainer(forKey: .coordinates)

        // Extract properties
        self.magnitude = try properties.decodeIfPresent(Double.self, forKey: .magnitude)
        self.time = try properties.decode(Date.self, forKey: .time)
        self.place = try properties.decode(String.self, forKey: .place)
        self.longitude = try coordinates.decode(Double.self)
        self.latitude = try coordinates.decode(Double.self)

        super.init()
    }
}
