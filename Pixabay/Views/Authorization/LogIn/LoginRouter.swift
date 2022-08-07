//
//  LoginRouter.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import UIKit

class LoginRouter: BaseRouting {
    
    func openRegistration() {
        let module = RegistrationAssembly.build()
        topViewController?.show(module, sender: self)
    }
    
    func openGallery() {
        let module = GalleryAssembly.build()
        topViewController?.show(module, sender: self)
    }
    
    func createAlertForLogIn(title: String) {
        let alert = UIAlertController(title: title,
                                      message: nil,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Retry",
                                     style: .default)
        
        alert.addAction(okAction)
        
        anyTopController?.present(alert, animated: true)

    }
}
