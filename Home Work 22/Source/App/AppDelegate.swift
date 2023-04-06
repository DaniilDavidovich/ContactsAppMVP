//
//  AppDelegate.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import CoreData


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
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
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Home_Work_22")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        let data = container.persistentStoreCoordinator
        return container
    }()
    
    // MARK: - Core Data Saving support

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

}

