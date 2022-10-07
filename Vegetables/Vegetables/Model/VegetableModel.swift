//
//  VegetableModel.swift
//  Vegetables
//
//  Created by alex on 2022/10/6.
//

import Foundation
import SwiftUI

struct Vegetable: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var classification: [String]
}
