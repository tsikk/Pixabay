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
    let webformatURL: String
    let user: String
    let userImageURL: String
    let largeImageURL: String
    let tags: String
    let imageWidth: Int
    let imageHeight: Int
    let views: Int
    let likes: Int
    let collections: Int
    let downloads: Int
}
