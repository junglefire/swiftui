//
//  ArticleDetailView.swift
//  Sheet
//
//  Created by alex on 2022/10/19.
//

import SwiftUI

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: { dismiss() }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 40)
        
                    Spacer()
                }
            }
        )
    }
}

//struct ArticleDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleDetailView(article: articles[0])
//    }
//}

