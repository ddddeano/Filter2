//
//  AddRestaurantSheetViewModel.swift
//  Filter
//
//  Created by Daniel Watson on 07/10/2021.
//

import Foundation
import MapKit
import Combine

class AddRestaurantSheetViewModel: ObservableObject {
    var kitchenHackModel = KitchenHackModel.kitchenHackModel

    @Published var google = ""
    @Published var placemarks: [Placemark] = []
    
    @Published var offsets: CGFloat = 0
    
    init() {
        addSubscribers()
    }
    private var cancels = Set<AnyCancellable>()
    func addSubscribers() {
        $google
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(search)
            .sink { [weak self] (returnedRestaurants) in
                self?.placemarks = returnedRestaurants
            }
            .store(in: &cancels)
    }
    
    func search(text: String) -> [Placemark]{
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = google
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                
                self.placemarks = mapItems.map {
                    Placemark(placemark: $0.placemark)
                }
                
            }
        }
        let offsets = self.calcOffsets()
        self.offsets = offsets
        return placemarks
    }
    
    func calcOffsets() -> CGFloat {
        if self.placemarks.count > 0 {
            return UIScreen.main.bounds.size.height -
            UIScreen.main.bounds.size.height / 4
        } else {
            return 100
        }
    }
    
}


