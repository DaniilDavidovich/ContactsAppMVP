//
//  MainViewController +Ext.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 12.04.23.
//

import Foundation
import UIKit


extension MainViewController {
    
    // for Dismis keyboard
    func hideKeyboardWhenTappedAround() {

    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
    view.endEditing(true)
    }
    
}
