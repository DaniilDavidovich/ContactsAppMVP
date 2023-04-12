//
//  CoreDataClass.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 1.04.23.
//

import Foundation
import UIKit
import CoreData


protocol CoreDataProtocol {
    var models: [ContactList]? { get set}
    var persistentContainer: NSPersistentContainer { get set }
    func getAllItems()
    func clearData()
    func saveContext()
    func createItem(name: String)
    func deleteItem(index: Int)
    func updateName(item: ContactList, newName: String)
    func updateGender(item: ContactList, newGender: String)
    func updateDate(item: ContactList, newDate: Date)
    func updateImage(item: ContactList, newImage: Data)
}


class CoreDataClass: CoreDataProtocol {
    
    var models: [ContactList]?
    
    var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Home_Work_22")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        let data = container.persistentStoreCoordinator
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getAllItems() {
        do {
            models = try context.fetch(ContactList.fetchRequest())
           
        } catch {
            print("Error")
        }
    }
    
    func clearData() {
        let persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        do {
            let stores = persistentStoreCoordinator.persistentStores
            for store in stores {
                try persistentStoreCoordinator.remove(store)
                try FileManager.default.removeItem(at: store.url!)
            }
        } catch let error {
            print("Failed to clear persistent stores: \(error)")
        }
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createItem(name: String) {
        let newItem = ContactList(context: context)
        newItem.name = name
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func deleteItem(index: Int) {
        guard let item = models?[index] else { return }
        context.delete(item)
       
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func updateName(item: ContactList, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func updateGender(item: ContactList, newGender: String) {
        item.gender = newGender
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func updateDate(item: ContactList, newDate: Date) {
        item.date = newDate
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func updateImage(item: ContactList, newImage: Data) {
        item.image = newImage
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
}
