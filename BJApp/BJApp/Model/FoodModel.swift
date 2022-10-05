//
//  FoodModel.swift
//  BJApp
//
//  Created by alex on 2022/10/4.
//

import Foundation

struct Food: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
