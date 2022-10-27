//
//  TransactionHeader.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct TransactionHeader: View {
    @Binding var listType: TransactionDisplayType
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent transactions")
                    .font(.headline)
                    .foregroundColor(Color("Heading"))
                    Spacer()
            }
            .padding(.bottom, 5)
            
            HStack {
                Group {
                    Text("All")
                        .padding(3)
                        .padding(.horizontal, 10)
                        .background(listType == .all ? Color("PrimaryButton") : Color("SecondaryButton"))
                        .onTapGesture {
                            self.listType = .all
                        }
                    
                    Text("Income")
                        .padding(3)
                        .padding(.horizontal, 10)
                        .background(listType == .income ? Color("PrimaryButton") : Color("SecondaryButton"))
                        .onTapGesture {
                            self.listType = .income
                        }
                    
                    Text("Expense")
                        .padding(3)
                        .padding(.horizontal, 10)
                        .background(listType == .expense ? Color("PrimaryButton") : Color("SecondaryButton"))
                        .onTapGesture {
                            self.listType = .expense
                        }
                }
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.white)
                .cornerRadius(15)
                
                Spacer()
            }
        }
    }
}

//struct TransactionHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionHeader()
//    }
//}
