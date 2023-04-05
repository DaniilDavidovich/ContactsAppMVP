//
//  DetailPresenter.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 5.04.23.
//

import Foundation

protocol DetailPresenterOutput: AnyObject {
    var contact: ContactList? { get set }
    func updateName()
    func updateGender()
    func updateDate()
    func updateImage(newImage: Data)
}

protocol DetailPresenterInput: AnyObject {
    func updateName(item: ContactList, newName: String)
    func updateGender(item: ContactList, newGender: String)
    func updateDate(item: ContactList, newDate: Date)
    func updateImage(item: ContactList, newImage: Data)
    init(view: DetailPresenterOutput, dataManager: CoreDataProtocol, contact: ContactList)
}

class DetailPresenter: DetailPresenterInput {
   
    
    weak var view: DetailPresenterOutput?
    var dataManager: CoreDataProtocol?
    var contact: ContactList?
    
    
    required init(view: DetailPresenterOutput, dataManager: CoreDataProtocol, contact: ContactList) {
        self.view = view
        self.dataManager = dataManager
        self.contact = contact
    }
    
    func setContact() {
        view?.contact = contact ?? ContactList()
    }
    
    func updateName(item: ContactList, newName: String) {
        print("update name: \(newName)")
        contact?.name = newName
        dataManager?.updateName(item: item, newName: newName)
        dataManager?.getAllItems()
    }
    
    func updateGender(item: ContactList, newGender: String) {
        contact?.gender = newGender
        dataManager?.getAllItems()
    }
    
    func updateDate(item: ContactList, newDate: Date) {
        contact?.date = newDate
        dataManager?.getAllItems()
    }
    
    func updateImage(item: ContactList, newImage: Data) {
        contact?.image = newImage
        dataManager?.getAllItems()
    }
    
    
}
