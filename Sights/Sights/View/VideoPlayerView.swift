//
//  VideoPlayerView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mov"))
                .overlay(
                    Image("Logo").resizable().scaledToFit().frame(width:32, height: 32).padding(.top, 6).padding(.horizontal, 8),
                    alignment: .topLeading
                )
        } //: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

//struct VideoPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPlayerView()
//    }
//}
