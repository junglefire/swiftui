//
//  ContentView.swift
//  AsyncImage
//
//  Created by alex on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    let imageURL = "https://zorrozou.github.io/assets/img/logo.png"

    var body: some View {
        // AsyncImage(url: URL(string: imageURL))
        
        // AsyncImage(url: URL(string: imageURL), scale: 2.0)
        
        /*
        AsyncImage(
            url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.purple.opacity(0.1)
            }
            .frame(width: 300, height: 500)
            .cornerRadius(20)
         */
        
        /*
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                Color.purple.opacity(0.1)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(_):
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFit()
            @unknown default:
                Image(systemName: "exclamationmark.icloud")
            }
        }
        .frame(width: 300, height: 300)
        .cornerRadius(20)
         */
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring())) { phase in
            switch phase {
            case .empty:
                Color.purple.opacity(0.1)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .transition(.slide)
            case .failure(_):
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFit()
            @unknown default:
                Image(systemName: "exclamationmark.icloud")
            }
        }
        .frame(width: 300, height: 300)
        .cornerRadius(20)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
