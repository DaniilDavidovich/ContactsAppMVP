//
//  Entity+CoreDataProperties.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var gender: String?

}

extension Entity : Identifiable {

}
