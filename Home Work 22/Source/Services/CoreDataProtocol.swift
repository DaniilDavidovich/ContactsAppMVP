//
//  CoreDataProtocol.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 5.04.23.
//

import Foundation

protocol CoreDataProtocol {
    var models: [ContactList]? { get set}
    func getAllItems()
    func createItem(name: String)
    func deleteItem(index: Int)
    func updateName(item: ContactList, newName: String)
    func updateGender(item: ContactList, newGender: String)
    func updateDate(item: ContactList, newDate: Date)
    func updateImage(item: ContactList, newImage: Data)
    
}
