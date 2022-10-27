//
//  TitleBar.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct TitleBar: View {
    var viewModel: PaymentDetailViewModel
    
    var body: some View {
        HStack {
            Text("Payment Details")
                .font(.headline)
                .foregroundColor(Color("Heading"))

            Image(systemName: viewModel.typeIcon)
                .foregroundColor(Color("ExpenseCard"))
            
            Spacer()
        }
        .padding()
    }
}

//struct TitleBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleBar()
//    }
//}
