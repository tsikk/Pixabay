//
//  RegistrationViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import Foundation
import FirebaseAuth

class RegistrationViewModel: BaseViewModel {
    
    let auth = Auth.auth()

    func onSignUp(email: String, age: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error  in
            guard result != nil, error == nil else { return }

        }
    }
    
    func validateFields() {
        
    }
}
