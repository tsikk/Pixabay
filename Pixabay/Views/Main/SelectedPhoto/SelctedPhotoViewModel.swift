//
//  SelctedPhotoViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation

class SelectedPhotoViewModel: BaseViewModel {
    let data: Hits
    
    init(data: Hits) {
        self.data = data
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
