//
//  ViewControllerPresenter.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 5.04.23.
//

import Foundation


protocol MainPresenterOutput: AnyObject {
    func tableReloadData()
}

protocol MainPresenterInput {
    init(view: MainPresenterOutput, dataManager: CoreDataProtocol)
    func getAllItems()
    func createItem(name: String)
    func deleteItem(_ index: Int)
    func getModelDataCount() -> Int
    func getContact(_ index: Int) -> ContactList?
}

class MainPresenter: MainPresenterInput {
   
    weak var view: MainPresenterOutput?
    let dataManager: CoreDataProtocol
    
    required init(view: MainPresenterOutput, dataManager: CoreDataProtocol) {
        self.view = view
        self.dataManager = dataManager
    }
    
    func getAllItems() {
        dataManager.getAllItems()
        view?.tableReloadData()
    }
    
    func createItem(name: String) {
        dataManager.createItem(name: name)
        view?.tableReloadData()
    }
    
    func deleteItem(_ index: Int) {
        dataManager.deleteItem(index: index)
        view?.tableReloadData()
    }
    
    func getModelDataCount() -> Int {
        return dataManager.models?.count ?? 0
    }
    
    func getContact(_ index: Int) -> ContactList? {
        return dataManager.models?[index]
    }
}
