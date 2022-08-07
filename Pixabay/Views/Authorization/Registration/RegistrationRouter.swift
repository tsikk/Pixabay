//
//  RegistrationRouter.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 07.08.22.
//

import UIKit

class RegistrationRouter: BaseRouting {
    
    func closeModule() {
        topNavigationController?.navigationController?.dismiss(animated: true)
    }
    
    func createAlertForSignUp(title: String) {
        let alert = UIAlertController(title: title,
                                      message: nil,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        
        alert.addAction(okAction)
        
        anyTopController?.present(alert, animated: true)

    }
}
