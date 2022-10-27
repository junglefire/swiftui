//
//  ArticleCardView.swift
//  AppStore
//
//  Created by alex on 2022/10/27.
//

import SwiftUI

struct ArticleCardView: View {
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    var content: String = ""
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: self.isShowContent ? geometry.size.height * 0.7 : min(self.image.size.height/3, 500))
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), width: self.isShowContent ? 0 : 1)
                            .cornerRadius(15)
                            .overlay(
                                ArticleExcerptView(category: self.category, headline: self.headline, subHeadline: self.subHeadline, isShowContent: self.$isShowContent)
                                    .cornerRadius(self.isShowContent ? 0 : 15)
                            )
                        
                        // Content
                        if self.isShowContent {
                            Text(self.content)
                                .foregroundColor(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .top))
                        }
                    }
                }
                .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: self.isShowContent ? 0 : 15)
                
                // Close button
                if self.isShowContent {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.1)) {
                                self.isShowContent = false
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
        }
    }
}


//struct ArticleCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleCardView(
//            category: sampleArticles[1].category,
//            headline: sampleArticles[1].headline,
//            subHeadline: sampleArticles[1].subHeadline,
//            image: sampleArticles[1].image,
//            content: sampleArticles[1].content, isShowContent: .constant(true)
//        )
//    }
//}
