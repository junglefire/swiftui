//
//  FormDateField.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct FormDateField: View {
    let name: String
    
    @Binding var value: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name.uppercased())
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            DatePicker("", selection: $value, displayedComponents: .date)
                .accentColor(.primary)
                .padding(10)
                .border(Color("Border"), width: 1.0)
                .labelsHidden()
        }
    }
}

//struct FormDateField_Previews: PreviewProvider {
//    static var previews: some View {
//        FormDateField()
//    }
//}
