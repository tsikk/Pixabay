//
//  BaseViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation

class BaseViewModel: ViewModeling, ObservableObject {

    required init() {
        initialSetup()
    }

    func initialSetup() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}

}
