//
//  InsetGalleryView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct InsetGalleryView: View {
    let place: Place

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing:15) {
                ForEach(place.gallery, id:\.self) { item in
                    Image(item).resizable().scaledToFit().frame(height: 200).cornerRadius(12)
                } //: Loop
            } //: HStack
        } //: ScrollView
    }
}

//struct InsetGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        InsetGalleryView()
//    }
//}
