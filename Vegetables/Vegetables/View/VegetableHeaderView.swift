//
//  VegetableHeaderView.swift
//  Vegetables
//
//  Created by alex on 2022/10/7.
//

import SwiftUI

struct VegetableHeaderView: View {
    var vegetable: Vegetable
  
    @State private var isAnimatingImage: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: vegetable.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
      
            Image(vegetable.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8 )
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        }//: ZStack
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
}

//struct VegetableHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        VegetableHeaderView()
//    }
//}
