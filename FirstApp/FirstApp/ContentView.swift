//
//  ContentView.swift
//  FirstApp
//
//  Created by alex on 2022/9/30.
//

import SwiftUI

struct ContentView: View {
    let cards: [Card] = cardData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
        }
        .padding(20)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
