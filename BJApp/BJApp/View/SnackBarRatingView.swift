//
//  SnackBarRatingView.swift
//  BJApp
//
//  Created by alex on 2022/10/4.
//

import SwiftUI

struct SnackBarRatingView: View {
    let snackBar: SnackBar
  
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(snackBar.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

//struct SnackBarRatingView_Previews: PreviewProvider {
//  static var previews: some View {
//    SnackBarRatingView(snackBar: snackBarsData[1])
//      .previewLayout(.fixed(width: 320, height: 60))
//  }
//}


