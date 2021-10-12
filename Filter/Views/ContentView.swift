//
//  ContentView.swift
//  Filter
//
//  Created by Daniel Watson on 07/10/2021.
//


import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var vm = AddRestaurantSheetViewModel()
    
    var body: some View {
        ZStack {
            MapView(restaurants: vm.placemarks)
            VStack {
                GoogleSearchBarView().environmentObject(vm)
                    .padding()
                    .offset(y: 44)
                Spacer()
                GoogleSearchListView()
                    .environmentObject(vm)
                    .offset(y: vm.offsets)
            }
        }
    }
}
struct GoogleSearchListView: View {
    @EnvironmentObject var vm: AddRestaurantSheetViewModel
    
    var body: some View {
            List {
                ForEach(vm.placemarks, id:\.id) { placemark in
                    PlacemarkRowView(placemark: placemark)
            }
        }
    }
}

struct PlacemarkRowView: View {
    var placemark: Placemark
    var body: some View {
        NavigationLink(destination: PlacemarkDetailView(placemark: placemark)) {
            Text(placemark.name)
        }
    }
}


struct GoogleSearchBarView: View {
    @EnvironmentObject var vm: AddRestaurantSheetViewModel
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    vm.google.isEmpty ?
                    Color.red : Color.blue)
            
            TextField("Search by name or symbol...", text: $vm.google)
                .disableAutocorrection(true)
                .foregroundColor(Color.yellow)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.green)
                        .opacity(vm.google.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            vm.google = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.green)
                .shadow(
                    color: Color.green.opacity(0.15),
                    radius: 10, x:0, y:0)
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let vm = AddRestaurantSheetViewModel()

    static var previews: some View {
        let MKpm = MKPlacemark()
        let pm = Placemark(placemark: MKpm)
        
        ContentView()
        GoogleSearchListView().environmentObject(vm)
        GoogleSearchBarView().environmentObject(vm)
        PlacemarkRowView(placemark: pm)
    }
}

