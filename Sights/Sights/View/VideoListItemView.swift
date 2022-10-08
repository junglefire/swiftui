//
//  VideoListItemView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct VideoListItemView: View {
    let video: Video
    
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail).resizable().scaledToFit().frame(height: 80).cornerRadius(9)
                Image(systemName: "play.circle").resizable().scaledToFit().frame(height: 32).shadow(radius: 4)
            } //: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name).font(.title2).fontWeight(.heavy).foregroundColor(.accentColor)
                Text(video.headline).font(.footnote).multilineTextAlignment(.leading)
            } //: VStack
        } //: HStack
    }
}

//struct VideoListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoListItemView()
//    }
//}
