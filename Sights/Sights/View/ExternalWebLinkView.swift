//
//  ExternalWebLinkView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let place: Place

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("百度百科")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(place.name, destination: (URL(string: place.link) ?? URL(string: "https://baike.baidu.com/"))!)
                } //: Group
                .foregroundColor(.accentColor)
            } //: HStack
        } //: GroupBox
    }
}

//struct ExternalWebLinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExternalWebLinkView()
//    }
//}
