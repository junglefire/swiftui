//
//  TotalBalanceCard.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct TotalBalanceCard: View {
    var totalBalance = 0.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("TotalBalanceCard"))
                .cornerRadius(15.0)
         
            VStack {
                Text("Total Balance")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text(NumberFormatter.currency(from: totalBalance))
                    .font(.system(size: 80, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.1)
            }
        }
        .frame(height: 200)
    }
}

//struct TotalBalanceCard_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalBalanceCard()
//    }
//}
