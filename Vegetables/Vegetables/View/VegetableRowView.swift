//
//  VegetableRowView.swift
//  Vegetables
//
//  Created by alex on 2022/10/6.
//

import SwiftUI

struct VegetableRowView: View {
    var vegetable: Vegetable
  
    var body: some View {
        HStack {
            Image(vegetable.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2 )
                .background(LinearGradient(gradient: Gradient(colors: vegetable.gradientColors), startPoint: .top, endPoint: .bottom))
                .cornerRadius(8)
      
            VStack(alignment: .leading, spacing: 5) {
                Text(vegetable.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(vegetable.headline)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

//struct VegetableRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        VegetableRowView()
//    }
//}
