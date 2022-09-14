//
//  GalleryRouter.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import UIKit

class GalleryRouter: BaseRouting {
    
    func openSelectedPhoto(with data: Hits) {
        let module = SelectedPhotoAssembly.build(with: data)
        topViewController?.show(module, sender: self)
    }
    
    func createAlert(title: String) {
        let alert = UIAlertController(title: title,
                                      message: nil,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        
        alert.addAction(okAction)
        
        anyTopController?.present(alert, animated: true)

    }
}
