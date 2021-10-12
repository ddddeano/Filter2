//
//  Extension.swift
//  Filter
//
//  Created by Daniel Watson on 07/10/2021.
//

import Foundation
import UIKit
import MapKit
extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Local Shop"
        return annotation
    }
}
