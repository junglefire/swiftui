//
//  ContentView.swift
//  Searchable
//
//  Created by alex on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.isSearching)
    private var isSearching: Bool
    
    @State var articles = sampleArticles
    @State private var searchText = ""
    
    @State var searchResult: [Article] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    ArticleRow(article: article)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("AppCoda")
        }
        /*
        .searchable(text: $searchText) {
            Text("SwiftUI").searchCompletion("SwiftUI")
            Text("iOS 15").searchCompletion("iOS 15")
        }
         */
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
            Text("SwiftUI").searchCompletion("SwiftUI")
            Text("iOS 15").searchCompletion("iOS 15")
        }
        .onChange(of: searchText) { searchText in
            print("onChange called: \(searchText) | \(isSearching)")
            if !searchText.isEmpty {
                articles = sampleArticles.filter { $0.title.contains(searchText) }
            } else {
                articles = sampleArticles
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
