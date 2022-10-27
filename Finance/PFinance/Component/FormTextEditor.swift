//
//  FormTextEditor.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct FormTextEditor: View {
    let name: String
    var height: CGFloat = 80.0
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name.uppercased())
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            TextEditor(text: $value)
                .frame(minHeight: height)
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
        }
    }
}

//struct FormTextEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        FormTextEditor()
//    }
//}
