//
//  MainView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct MainView: View {
	var body: some View {
		TabView {
			ContentView()
				.tabItem {
					Image(systemName: "square.grid.2x2")
					Text("浏览")
				}
      
			VideoListView()
				.tabItem {
					Image(systemName: "play.rectangle")
					Text("视频")
				}
      
			MapView()
				.tabItem {
					Image(systemName: "map")
					Text("位置")
				}
      
			GalleryView()
				.tabItem {
					Image(systemName: "photo")
					Text("照片")
				}
		} //: Tab
	}
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
