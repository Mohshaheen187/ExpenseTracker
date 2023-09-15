//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

enum TransactionType {
    case income
    case outcome
}

struct MainView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @State private var addNewIncome : Bool = false
    @State private var selectedTransactionType : TransactionType = .income
    @State private var incomeBalance: Double = 0.0
    @State private var outcomeBalance: Double = 0.0
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $selectedTransactionType) {
                    Text("Income").tag(TransactionType.income)
                    Text("Outcome").tag(TransactionType.outcome)
                }
                .pickerStyle(.segmented)
                
                if selectedTransactionType == .income {
                    IncomeView(incomeBalance: $incomeBalance)
                } else {
                    OutcomeView(outcomeBalance: $outcomeBalance)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Balance: \(String(format: "%.2f", updateBalance()))")
            .tint(Color("color4"))
            .font(Font.custom("Fonzie", size: 20))
        }
    }
    
    func updateBalance() -> Double {
        return incomeBalance - outcomeBalance
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
