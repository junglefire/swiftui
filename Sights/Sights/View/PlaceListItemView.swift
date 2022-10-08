//
//  PlaceListItemView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct PlaceListItemView: View {
    let place: Place

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(place.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
      
            VStack(alignment: .leading, spacing: 8) {
                Text(place.image)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
        
                Text(place.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            } //: VStack
        } //: HStack
    }
}

//struct PlaceListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListItemView()
//    }
//}
