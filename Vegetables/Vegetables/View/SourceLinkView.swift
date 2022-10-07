//
//  SourceLinkView.swift
//  Vegetables
//
//  Created by alex on 2022/10/7.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox() {
            HStack {
                Text("内容来源")
                Spacer()
                Link("百度百科", destination: URL(string: "https://baike.baidu.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

//struct SourceLinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        SourceLinkView()
//    }
//}
