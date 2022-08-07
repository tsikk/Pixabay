//
//  RegistrationViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import Foundation
import FirebaseAuth
import Firebase

class RegistrationViewModel: BaseViewModel {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var age: String = ""
    
    @Published var emailPrompt: String = "Enter with valid format, Fill email with proper form"
    @Published var passwordPrompt: String = "Password must be between 6 and 12 digits long and include at least one numeric digit"
    @Published var confirmPasswordPrompt: String = "Make sure password matches"
    @Published var agePrompt: String = "Age range is from 18 to 99"
    
    private let router = RegistrationRouter()
    
    let auth = Auth.auth()

    func onSignUp() {
        auth.createUser(withEmail: email, password: password) { result, error  in
            guard result != nil, error == nil else { return }
            
            self.router.createAlertForSignUp(title: "Registered Succesfully")

            let db = Firestore.firestore()
            
            db.collection("users").addDocument(data: [
                "age": self.age,
                "email": self.email,
                "uid": result!.user.uid
            ]) { error in
                print(error as Any)
            }
            
        }
    }
    
    // MARK: Validation Functions
    
    /// Checls if passwords matches or not
    func passwordsMatch() -> Bool  {
        return password == confirmPassword
    }
    
    /// Password expression. Password must be between 6 and 12 digits long and include at least one numeric digit.
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^.{6,12}$")
        return passwordTest.evaluate(with: password)
    }
    
    /// This regex matches email addresses, and checks that they are of the proper form. It checks to ensure the top level domain is between 2 and 4 characters long, but does not check the specific domain against a list (especially since there are so many of them now).
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@ ", "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")
        return emailTest.evaluate(with: email)
    }
    
    /// Validates age range 18 - 99
    func isAgeValid() -> Bool {
        let ageTest = NSPredicate(format: "SELF MATCHES %@", "^(1[89]|[2-9]\\d)$")
        return ageTest.evaluate(with: age)
    }
    
    var isSignUpComplete: Bool {
        if !passwordsMatch() || !isPasswordValid() || !isEmailValid() || !isAgeValid() {
            return false
        }
        
        return true
    }
}
