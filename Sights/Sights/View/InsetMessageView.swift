//
//  InsetMessageView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct InsetMessageView: View {
    let place: Place

    var body: some View {
        GroupBox {
            TabView {
                ForEach(place.message, id: \.self) { item in
                    Text(item)
                } //: Loop
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

//struct InsetMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        InsetMessageView()
//    }
//}
