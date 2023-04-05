//
//  Bilder.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 5.04.23.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: BuilderProtocol {
    static func createMainModule() -> UIViewController {
        let dataManager = CoreDataClass()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, dataManager: dataManager)
        view.presenter = presenter
        return view
    }
    
    
}
