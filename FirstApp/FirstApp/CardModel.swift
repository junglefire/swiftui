//
//  CardModel.swift
//  FirstApp
//
//  Created by alex on 2022/10/1.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}

