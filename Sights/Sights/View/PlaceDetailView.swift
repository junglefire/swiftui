//
//    PlaceDetailView.swift
//    Sights
//
//    Created by alex on 2022/10/8.
//

import SwiftUI

struct PlaceDetailView: View {
    let place: Place

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // 横幅图片
                Image(place.image).resizable().scaledToFit()
                
                // 标题
                Text(place.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor.frame(height: 6).offset(y: 24)
                    )
                
                // 提要
                Text(place.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // 画册
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "中国的名胜古迹")
                    InsetGalleryView(place: place)
                }
                .padding(.horizontal)
                
                // 相关信息
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "你知道吗？")
                    InsetMessageView(place: place)
                }
                .padding(.horizontal)
                
                // 具体描述
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "关于 \(place.name)")
                    Text(place.description).multilineTextAlignment(.leading).layoutPriority(1)
                }
                .padding(.horizontal)
                
                // 地图
                Group {
                    HeadingView(headingImage: "map", headingText: "名胜古迹")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // 链接
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "了解更多")
                    ExternalWebLinkView(place: place)
                }
                .padding(.horizontal)
            } //: VStack
        } //: ScrollView
        .navigationBarTitle("了解关于 \(place.name)", displayMode: .inline)
    }
}

//struct PlaceDetailView_Previews: PreviewProvider {
//        static var previews: some View {
//                PlaceDetailView()
//        }
//}
