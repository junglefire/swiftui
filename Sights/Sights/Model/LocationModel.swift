//
//  LocationModel.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import Foundation
import MapKit

struct PlaceLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // 计算属性
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
