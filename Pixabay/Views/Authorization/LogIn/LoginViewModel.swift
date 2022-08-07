//
//  LoginViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import Foundation
import FirebaseAuth

class LoginViewModel: BaseViewModel {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let router = LoginRouter()
    let auth = Auth.auth()
     
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func onSignIn()  {
        guard !email.isEmpty, !password.isEmpty else { return }

        auth.signIn(withEmail: email, password: password ) { result, error in
            if result != nil && error == nil {
                self.router.openGallery()
            } else {
                self.router.createAlertForLogIn(title: "Your Email or Password is incorrect")
            }
        }
    }
    
    func onRegisterButton() {
        router.openRegistration()
    }
  
}
