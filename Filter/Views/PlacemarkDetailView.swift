//
//  PlaceMarkDetailView.swift
//  Filter
//
//  Created by Daniel Watson on 08/10/2021.
//

import SwiftUI
import MapKit

class PlacemarkDetailViewModel: ObservableObject {
    
    func convert(placemark: Placemark) {
        _ = Restaurant(name: placemark.name)
        
    }
}

struct PlacemarkDetailView: View {
    
    @StateObject var vm = PlacemarkDetailViewModel()
    
    var placemark: Placemark
    
    var body: some View {
            Text("Rogers Tea House")
        .onTapGesture {
            vm.convert(placemark: placemark)
        }
    }
}
//
//struct PlacemarkDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacemarkDetailView(placemark: Placemark(placemark: MKPlacemark(coordinate: .constant)))
//    }
//}
