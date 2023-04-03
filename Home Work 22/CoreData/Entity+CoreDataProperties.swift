//
//  Entity+CoreDataProperties.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//
//

import Foundation
import CoreData


extension ContactList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactList> {
        return NSFetchRequest<ContactList>(entityName: "ContactList")
    }

    @NSManaged public var image: Date?
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var gender: String?

}

extension ContactList : Identifiable {

}
