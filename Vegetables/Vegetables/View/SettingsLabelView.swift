//
//  SettingsLabelView.swift
//  Vegetables
//
//  Created by alex on 2022/10/7.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
  
    var body: some View {
        HStack {
            Text(labelText)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

//struct SettingsLabelView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsLabelView()
//    }
//}
