//
//  DataModel.swift
//  Filter
//
//  Created by Daniel Watson on 07/10/2021.
//

import Foundation
import MapKit

struct Placemark: Identifiable {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    var name: String {
        self.placemark.name ?? ""
    }
    var title: String {
        self.placemark.title ?? ""
    }
    var description: String {
        self.placemark.description
    }
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}

struct Restaurant {
    var name: String
}
