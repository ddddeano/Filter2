//
//  EntityStorage.swift
//  Filter
//
//  Created by Daniel Watson on 10/10/2021.
//

import Foundation
import Combine
import CoreData

class EntityStorage: NSObject, ObservableObject {
    var entities = CurrentValueSubject<[Entity], Never>([])
    private let entityFetchController: NSFetchedResultsController<Entity>
    
    static let shared: EntityStorage = EntityStorage()
    
    private override init() {
        entityFetchController = NSFetchedResultsController (
            fetchRequest: Entity.fetchRequest(),
            managedObjectContext: pC.viewContext,
            sectionNameKeyPath: nil, cacheName: nil
        )
    }
}
