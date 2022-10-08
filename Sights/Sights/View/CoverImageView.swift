//
//  CoverImageView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name).resizable().scaledToFill()
            } //: Loop
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

//struct CoverImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoverImageView()
//    }
//}
