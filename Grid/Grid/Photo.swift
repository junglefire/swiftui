//
//  Photo.swift
//  Grid
//
//  Created by alex on 2022/10/29.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map {
    Photo(name: "coffee-\($0)")
}
