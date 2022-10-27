//
//  TransactionCellView.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct TransactionCellView: View {
    @ObservedObject var transaction: PaymentActivity

    var body: some View {
        HStack(spacing: 20) {
            
            if transaction.isFault {
                EmptyView()
            }  else {
                Image(systemName: transaction.type == .income ? "arrowtriangle.up.circle.fill" : "arrowtriangle.down.circle.fill")
                    .font(.title)
                    .foregroundColor(Color(transaction.type == .income ? "IncomeCard" : "ExpenseCard"))
                
                VStack(alignment: .leading) {
                    Text(transaction.name)
                        .font(.system(.body, design: .rounded))
                    Text(transaction.date.string())
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.gray)
                }
        
                Spacer()
                
                Text((transaction.type == .income ? "+" : "-") + NumberFormatter.currency(from: transaction.amount))
                    .font(.system(.headline, design: .rounded))
            }
        }
        .padding(.vertical, 5)
    }
}

//struct TransactionCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionCellView()
//    }
//}
