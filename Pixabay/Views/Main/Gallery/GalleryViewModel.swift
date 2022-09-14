//
//  GalleryViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation
import Firebase
import Alamofire

class GalleryViewModel: BaseViewModel {
    
    @Published var photos = [Hits]()
    private let service: GalleryService
    private let router = GalleryRouter()

    init(service: GalleryService) {
        self.service = service
    }

    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        service.getGalleryWithAF { result in
            
            switch result {
            case .success(let gallery):
                self.photos = gallery.hits
            case .failure(let error):
                self.router.createAlert(title: error.errorDescription ?? "Unable to retrieve the data")
            }
        }

    }

    func selectPhoto(with id: Int) {
        let selectedPhoto = photos.filter { $0.id == id }
        router.openSelectedPhoto(with: selectedPhoto.first ?? Hits(id: 0, webformatURL: "", user: "", userImageURL: "", largeImageURL: "", tags: "", imageWidth: 0, imageHeight: 0, views: 0, likes: 0, collections: 0, downloads: 0))
    }
    
    func onSignOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error)
        }
    }
}
