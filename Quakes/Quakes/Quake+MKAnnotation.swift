//
//  Quake+MKAnnotation.swift
//  Quakes
//
//  Created by Tobi Kuyoro on 07/05/2020.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import MapKit

extension Quake: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var title: String? {
        return place
    }

    var subtitle: String? {
        if let magnitude = magnitude {
            return "MAgnitude: \(magnitude)"
        } else {
            return "Magnitude: N/A"
        }
    }
}
