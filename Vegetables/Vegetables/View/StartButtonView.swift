//
//  StartButtonView.swift
//  Vegetables
//
//  Created by alex on 2022/10/6.
//

import SwiftUI

struct StartButtonView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
  
    var body: some View {
        Button(action: {
            isOnboarding = false
        }) {
            HStack(spacing: 8) {
                Text("开始")
                Image(systemName: "arrow.right.circle").imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Capsule().strokeBorder(Color.white, lineWidth: 1.25))
        }
        .accentColor(.white)
    }
}

//struct StartButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartButtonView()
//    }
//}
