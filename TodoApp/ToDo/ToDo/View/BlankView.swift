//
//  BlankView.swift
//  ToDo
//
//  Created by alex on 2022/10/25.
//

import SwiftUI

struct BlankView : View {
    var bgColor: Color

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

//struct BlankView_Previews: PreviewProvider {
//    static var previews: some View {
//        BlankView()
//    }
//}
