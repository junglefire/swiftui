//
//  MenuBar.swift
//  PFinance
//
//  Created by alex on 2022/10/26.
//

import SwiftUI

struct MenuBar<Content>: View where Content: View {
    @State private var showPaymentForm = false
    
    let modalContent: () -> Content
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(alignment: .center) {
                Spacer()
                
                VStack(alignment: .center) {
                    Text(Date.today.string(with: "EEEE, MMM d, yyyy"))
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Personal Finance")
                        .font(.title)
                        .fontWeight(.black)
                }
                
                Spacer()
            }
            
            Button(action: {
                self.showPaymentForm = true
            }) {
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundColor(.primary)
            }

            .sheet(isPresented: self.$showPaymentForm, onDismiss: {
                self.showPaymentForm = false
            }) {
                self.modalContent()
            }
        }

    }
}

//struct MenuBar_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuBar()
//    }
//}
