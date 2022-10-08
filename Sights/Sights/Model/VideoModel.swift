//
//  VideoModel.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
  
    // 计算属性
    var thumbnail: String {
        get {
            return "视频封面-\(name)"
        }
    }
}
