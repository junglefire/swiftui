//
//  OnboardingView.swift
//  Vegetables
//
//  Created by alex on 2022/10/6.
//

import SwiftUI

struct OnboardingView: View {
    var vegetables: [Vegetable]
  
    var body: some View {
        TabView {
            ForEach(vegetables[0 ..< 5]) { item in
                VegetableCardView(vegetable: item)
            } //: Loop
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
