//
//  SnackBarModel.swift
//  BJApp
//
//  Created by alex on 2022/10/4.
//

import Foundation

struct SnackBar: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var rating: Int
    var serves: Int
    var preparation: Int
    var hot: Int
    var introduction: [String]
    var method: [String]
}
