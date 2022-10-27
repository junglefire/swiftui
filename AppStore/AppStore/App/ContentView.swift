//
//  ContentView.swift
//  AppStore
//
//  Created by alex on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    @State private var showContents: [Bool] = Array(repeating: false, count: sampleArticles.count)
    
    enum ContentMode {
        case list
        case content
    }

    private var contentMode: ContentMode {
        self.showContents.contains(true) ? .content : .list
    }
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                VStack(spacing: 40) {
                    TopBarView()
                        .padding(.horizontal, 20)
                        .opacity(self.contentMode == .content ? 0 : 1)
                    
                    ForEach(sampleArticles.indices) { index in
                        GeometryReader { inner in
                            ArticleCardView(
                                category: sampleArticles[index].category,
                                headline: sampleArticles[index].headline,
                                subHeadline: sampleArticles[index].subHeadline,
                                image: sampleArticles[index].image,
                                content: sampleArticles[index].content, isShowContent: self.$showContents[index]
                            )
                            .offset(y: self.showContents[index] ? -inner.frame(in: .global).minY : 0)
                            .padding(.horizontal, self.showContents[index] ? 0 : 20)
                            .opacity(
                                self.contentMode == .list ||
                                self.contentMode == .content && self.showContents[index] ? 1 : 0
                            )
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.1)) {
                                    self.showContents[index] = true
                                }
                            }
                        }
                        .frame(height: self.showContents[index] ? fullView.size.height + fullView.safeAreaInsets.top + fullView.safeAreaInsets.bottom : min(sampleArticles[index].image.size.height/3, 500))
                        
                    }
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
