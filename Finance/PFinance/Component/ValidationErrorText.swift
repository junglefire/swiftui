//
//  ValidationErrorText.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct ValidationErrorText: View {
    var iconName = "info.circle"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    var text = ""
    
    var body: some View {
        HStack {
            Image(systemName: iconName).foregroundColor(iconColor)
            
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

//struct ValidationErrorText_Previews: PreviewProvider {
//    static var previews: some View {
//        ValidationErrorText()
//    }
//}
