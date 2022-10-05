//
//  HeaderModel.swift
//  BJApp
//
//  Created by alex on 2022/10/4.
//

import Foundation

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
