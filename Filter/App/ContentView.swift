//
//  ContentView.swift
//  Filter
//
//  Created by Daniel Watson on 13/10/2021.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    
    func makeCoordinator() -> Coordinator {
//
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
//
    }
}

struct ContentView: View {
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
