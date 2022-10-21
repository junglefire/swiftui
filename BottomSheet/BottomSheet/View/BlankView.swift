//
//  BlankView.swift
//  BottomSheet
//
//  Created by alex on 2022/10/21.
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
