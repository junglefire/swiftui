//
//  IncomeCard.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct IncomeCard: View {
    var income = 0.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("IncomeCard"))
                .cornerRadius(15.0)
         
            VStack {
                Text("Income")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text(NumberFormatter.currency(from: income))
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.1)
            }
        }
        .frame(height: 150)
    }
}

//struct IncomeCard_Previews: PreviewProvider {
//    static var previews: some View {
//        IncomeCard()
//    }
//}
