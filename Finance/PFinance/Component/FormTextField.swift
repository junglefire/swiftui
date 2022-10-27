//
//  FormTextField.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct FormTextField: View {
    let name: String
    var placeHolder: String
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name.uppercased())
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            TextField(placeHolder, text: $value)
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
                // .textFieldStyle(.roundedBorder)
                // .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

//struct FormTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        FormTextField()
//    }
//}
