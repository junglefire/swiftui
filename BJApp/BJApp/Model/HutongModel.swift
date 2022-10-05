//
//  HutongModel.swift
//  BJApp
//
//  Created by alex on 2022/10/4.
//

import Foundation

struct Hutong: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var ranking: String
    var description: String
    var times: String
    var feature: String
}
