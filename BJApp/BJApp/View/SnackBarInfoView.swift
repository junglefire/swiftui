//
//  SnackBarInfoView.swift
//  BJApp
//
//  Created by alex on 2022/10/4.
//

import SwiftUI

struct SnackBarInfoView: View {
    let snackBar: SnackBar
  
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.3")
                Text("可用餐人数: \(snackBar.serves)")
            }
      
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("备时: \(snackBar.preparation)")
            }
      
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("热度: \(snackBar.hot)")
            }
        }
        .font(.footnote)
        .foregroundColor(Color.gray)
    }
}

//struct SnackBarInfoView_Previews: PreviewProvider {
//  static var previews: some View {
//    SnackBarInfoView(snackBar: snackBarsData[0])
//      .previewLayout(.fixed(width: 320, height: 60))
//  }
//}
