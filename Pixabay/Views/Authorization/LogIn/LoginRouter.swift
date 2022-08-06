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
}
