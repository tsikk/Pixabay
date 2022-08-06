//
//  LoginViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import Foundation
import FirebaseAuth

class LoginViewModel: BaseViewModel {
    
    private let router = LoginRouter()
    let auth = Auth.auth()
     
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func onSignIn(email: String, password: String)  {
        auth.signIn(withEmail: email, password: password ) { result, error in
            guard result != nil, error == nil else { return }
            
        }
    }
    
    func onRegisterButton() {
        router.openRegistration()
    }
  
}
