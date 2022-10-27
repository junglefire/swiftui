//
//  ExpenseCard.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct ExpenseCard: View {
    var expense = 0.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("ExpenseCard"))
                .cornerRadius(15.0)
         
            VStack {
                Text("Expense")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .fixedSize()
                Text(NumberFormatter.currency(from: expense))
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.1)
                
            }
        }
        .frame(height: 150)
    }
}

//struct ExpenseCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenseCard()
//    }
//}
