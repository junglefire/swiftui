//
//  ArticleRow.swift
//  Searchable
//
//  Created by alex on 2022/10/31.
//

import SwiftUI

struct ArticleRow: View {
    let article: Article
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: article.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Color.purple.opacity(0.1)
            }
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            
            Text(article.title)
                .font(.system(.headline, design: .rounded))
        }
    }
}


//struct ArticleRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleRow()
//    }
//}
