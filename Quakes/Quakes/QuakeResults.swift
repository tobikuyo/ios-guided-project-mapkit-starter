//
//  QuakeResults.swift
//  Quakes
//
//  Created by Tobi Kuyoro on 07/05/2020.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

class QuakeResults: Decodable {
    let quakes: [Quake]

    enum CodingKeys: String, CodingKey {
        case quakes = "features"
    }
}
