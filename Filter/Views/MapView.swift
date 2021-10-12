//
//  MapView.swift
//  Filter
//
//  Created by Daniel Watson on 07/10/2021.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let restaurants: [Placemark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(from: uiView)
    }
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.restaurants.map(RestaurantAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}
