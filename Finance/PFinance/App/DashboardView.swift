//
//  DashboardView.swift
//  PFinance
//
//  Created by Simon Ng on 12/9/2020.
//

import SwiftUI
import CoreData

enum TransactionDisplayType {
    case all
    case income
    case expense
}

struct DashboardView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: PaymentActivity.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \PaymentActivity.date, ascending: false) ])
    var paymentActivities: FetchedResults<PaymentActivity>
    
    @State private var showPaymentDetails = false
    @State private var editPaymentDetails = false
    
    private var totalIncome: Double {
        let total = paymentActivities
            .filter {
                $0.type == .income
            }.reduce(0) {
                $0 + $1.amount
            }
        return total
    }
    
    private var totalExpense: Double {
        let total = paymentActivities
            .filter {
                $0.type == .expense
            }.reduce(0) {
                $0 + $1.amount
            }
        return total
    }
    
    private var totalBalance: Double {
        return totalIncome - totalExpense
    }
    
    private var paymentDataForView: [PaymentActivity] {
        switch listType {
        case .all:
            return paymentActivities
                .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        case .income:
            return paymentActivities
                .filter { $0.type == .income }
                .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        case .expense:
            return paymentActivities
                .filter { $0.type == .expense }
                .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        }
    }
    
    @State private var listType: TransactionDisplayType = .all
    @State private var selectedPaymentActivity: PaymentActivity?
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                MenuBar() {
                    PaymentFormView().environment(\.managedObjectContext, self.context)
                }
                .listRowInsets(EdgeInsets())
                
                VStack {
                    TotalBalanceCard(totalBalance: totalBalance)
                        .padding(.vertical)
                    
                    HStack(spacing: 15) {
                        IncomeCard(income: totalIncome)
                        ExpenseCard(expense: totalExpense)
                    }
                    .padding(.bottom)
                    
                    TransactionHeader(listType: $listType)
                        .padding(.bottom)
                }
                
                // List the transaction records
                ForEach(paymentDataForView) { transaction in
                    TransactionCellView(transaction: transaction)
                        .onTapGesture {
                            self.showPaymentDetails = true
                            self.selectedPaymentActivity = transaction
                        }
                        .contextMenu {
                            Button(action: {
                                // Edit payment details
                                self.editPaymentDetails = true
                                self.selectedPaymentActivity = transaction
                                
                            }) {
                                HStack {
                                    Text("Edit")
                                    Image(systemName: "pencil")
                                }
                            }
                            
                            Button(action: {
                                // Delete the selected payment
                                self.delete(payment: transaction)
                            }) {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                        }
                }
                .sheet(isPresented: self.$editPaymentDetails) {
                    PaymentFormView(payment: self.selectedPaymentActivity).environment(\.managedObjectContext, self.context)
                }

            }
            .offset(y: showPaymentDetails ? -100 : 0)
            .padding(.horizontal)
            .animation(.easeOut(duration: 0.2))
            
            if showPaymentDetails {
                BlankView(bgColor: .black)
                    .opacity(0.3)
                    .onTapGesture {
                        self.showPaymentDetails = false
                    }
                PaymentDetailView(isShow: $showPaymentDetails, payment: selectedPaymentActivity!)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut(duration: 0.2))
            }
        }
    }
    
    private func delete(payment: PaymentActivity) {
        self.context.delete(payment)
        do {
            try self.context.save()
        } catch {
            print("Failed to save the context: \(error.localizedDescription)")
        }
    }
}
