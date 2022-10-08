//
//  MapAnnotationView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct MapAnnotationView: View {
    var location: PlaceLocation
    
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 40, height: 40, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 35, height: 35, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 31, height: 31, alignment: .center)
                .clipShape(Circle())
        } //: ZStack
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

//struct MapAnnotationView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapAnnotationView()
//    }
//}
