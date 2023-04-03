//
//  ContactList+CoreDataProperties.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 3.04.23.
//
//

import Foundation
import CoreData


extension ContactList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactList> {
        return NSFetchRequest<ContactList>(entityName: "ContactList")
    }

    @NSManaged public var date: Date?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var image: Data?

}

extension ContactList : Identifiable {

}
