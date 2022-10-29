//
//  ContentView.swift
//  Grid
//
//  Created by alex on 2022/10/28.
//

import SwiftUI

struct MultiGridView: View {
    // @State var gridLayout: [GridItem] = [ GridItem() ]
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State var gridLayout = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(cafe.coffeePhotos) { photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 50)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                        .animation(.easeIn, value: gridLayout.count)
                    }
                }
                .padding(.all, 10) .animation(.interactiveSpring(), value: gridLayout.count)
            } .navigationTitle("Coffee Feed")
        }
        .onChange(of: verticalSizeClass) { value in
            self.gridLayout = [ GridItem(.adaptive(minimum:  verticalSizeClass == .compact ? 100 : 250)), GridItem(.flexible()) ]
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView1: View {
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(samplePhotos.indices) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            // .frame(height: 200)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                    }) {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct ContentView2: View {
    private var symbols = [
        "keyboard", "hifispeaker.fill", "printer.fill", "tv.fill",
        "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"
    ]

    private var colors: [Color] = [.yellow, .purple, .green]
    // private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    // private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    // private var gridItemLayout = [GridItem(.adaptive(minimum: 50))]
    // private var gridItemLayout = [GridItem(.fixed(100)), GridItem(.fixed(150))]
    private var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50 ))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((0...9999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView3: View {
    private var symbols = [
        "keyboard", "hifispeaker.fill", "printer.fill", "tv.fill",
        "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"
    ]

    private var colors: [Color] = [.yellow, .purple, .green]
    private var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50 ))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout, spacing: 20) {
                ForEach((0...9999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
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
