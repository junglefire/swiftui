//
//  PlaceModel.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import Foundation

struct Place: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let message: [String]
}
