//
//  UIViewController+Helper.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import UIKit

extension UIViewController {
    
    static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
    
}