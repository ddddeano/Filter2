//
//  FilterApp.swift
//  Filter
//
//  Created by Daniel Watson on 07/10/2021.
//

import SwiftUI
import CoreData

@main
struct FilterApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
        .onChange(of: scenePhase) { _ in
            try? pC.viewContext.save()
        }
    }
}

var pC: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "KitchenHackPC")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    return container
}()
func saveContext() {
    let context = pC.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
