//
//  ContentView.swift
//  Vegetables
//
//  Created by alex on 2022/10/5.
//

import SwiftUI

struct ContentView: View {
    var vegetables: [Vegetable] = vegetablesData
    @State private var isShowingSettings: Bool = false
  
    var body: some View {
        NavigationView {
            List {
                ForEach(vegetables.shuffled()) { item in
                    NavigationLink(destination: VegetableDetailView(vegetable: item)){
                        VegetableRowView(vegetable: item).padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("蔬菜")
            .navigationBarItems(
                trailing: Button(action: {
                    isShowingSettings = true

                }) {
                    Image(systemName: "slider.horizontal.3")
                }
                .sheet(isPresented: $isShowingSettings) {
                    SettingsView()
                }
            )
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
