//
//  GalleryRouter.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation

class GalleryRouter: BaseRouting {
    
    func openSelectedPhoto(with data: Hits) {
        let module = SelectedPhotoAssembly.build(with: data)
        topViewController?.show(module, sender: self)
    }
    
    func closeModule() {
        anyTopController?.wrapped.dismiss(animated: true)
    }
}
