//
//  ContentView.swift
//  MapView
//
//  Created by Daniel Watson on 13/10/2021.
//

import SwiftUI
import MapKit


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        print(location ?? "no location")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
        print(location)
    }
    
}


class Coordinator: NSObject, MKMapViewDelegate {
    
    var mapView: MapView
    
    init(_ mapView: MapView) {
        self.mapView = mapView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
}


struct MapView: UIViewRepresentable {
    
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
//
    }
}




struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
