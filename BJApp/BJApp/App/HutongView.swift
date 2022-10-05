//
//  HutongView.swift
//  BJApp
//
//  Created by alex on 2022/10/3.
//

import SwiftUI

struct HutongView: View {
    let hutongs: [Hutong] = hutongsData
  
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                
                HStack(alignment: .center, spacing: 25) {
                    ForEach(hutongs) { item in
                        HutongRankingView(hutong: item)
                    } //: Loop
                } //: HStack
                .padding(.vertical)
                .padding(.horizontal, 25)
                
                Spacer()
            } //: VStack
        } //: ScrollView
        .edgesIgnoringSafeArea(.all)
    }
}

//struct HutongView_Previews: PreviewProvider {
//    static var previews: some View {
//        HutongView()
//    }
//}
