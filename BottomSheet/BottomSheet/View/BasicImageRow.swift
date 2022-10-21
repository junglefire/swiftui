//
//  BasicImageRow.swift
//  BottomSheet
//
//  Created by alex on 2022/10/20.
//

import SwiftUI

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

//struct BasicImageRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicImageRow()
//    }
//}
