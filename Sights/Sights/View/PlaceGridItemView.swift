//
//  PlaceGridItemView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct PlaceGridItemView: View {
    let place: Place
    
    var body: some View {
        Image(place.image).resizable().scaledToFit().cornerRadius(12)
    }
}

//struct PlaceGridItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceGridItemView()
//    }
//}
