//
//  PreviewProvider.swift
//  Filter
//
//  Created by Daniel Watson on 10/10/2021.
//

import Foundation
import SwiftUI
import MapKit


extension PreviewProvider {
    
    static var dev: Developer {
        Developer.instance
    }
}

class Developer {
    
    static let instance = Developer()
    
    let placeMark1 = Placemark(placemark: MKPlacemark())
    
}

