//
//  GalleryModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation

struct Gallery: Decodable, Hashable {
    let hits: [Hits]
}

struct Hits: Decodable, Hashable {
    let id: Int
    let pageURL: String
    let downloads: Int
}
