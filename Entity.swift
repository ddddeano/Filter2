//
//  Entity+CoreDataProperties.swift
//  Filter
//
//  Created by Daniel Watson on 10/10/2021.
//
//

import Foundation
import CoreData

@objc(Entity)
public class Entity: NSManagedObject {

}

extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension Entity : Identifiable {

}
