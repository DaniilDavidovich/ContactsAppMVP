//
//  CoreDataClass.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 1.04.23.
//

import Foundation
import UIKit


class CoreDataClass {
    
    var models = [ContactList]()
    
    weak var delegate: ViewControllerDelegate?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    func getAllItems() {
        do {
            models = try context.fetch(ContactList.fetchRequest())
            DispatchQueue.main.async {
                self.delegate?.reloadData()
            }
           
        } catch {
            print("Error")
        }
    }
    
    func createItem(name: String) {
        let newItem = ContactList(context: context)
        newItem.name = name
        newItem.date = Date()
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func deleteItem(item: ContactList) {
        context.delete(item)
       
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func updateItem(item: ContactList, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
}
