//
//  CardView.swift
//  FirstApp
//
//  Created by alex on 2022/9/30.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    
    var body: some View {
        ZStack {
            Image(card.imageName)
          
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }.offset(y: -218)
          
            Button(action: {
                print("按钮被用户点击")
            }){
                HStack {
                    Text(card.callToAction)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }.padding(.vertical)
                 .padding(.horizontal, 24)
                 .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                 .clipShape(Capsule())
                 .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }.offset(y: 210)
        }.frame(width: 335, height: 545)
         .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
         .cornerRadius(16)
         .shadow(radius: 8)
        
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
