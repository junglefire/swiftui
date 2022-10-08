//
//  HeadingView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText: String

    var body: some View {
        HStack {
            Image(systemName: headingImage).foregroundColor(.accentColor).imageScale(.large)
            Text(headingText).font(.title3).fontWeight(.bold)
        }
    }
}

//struct HeadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadingView()
//    }
//}
