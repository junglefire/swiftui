//
//  Photo.swift
//  GridViewAnimation
//
//  Created by alex on 2022/10/31.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map {
    Photo(name: "coffee-\($0)")
}
