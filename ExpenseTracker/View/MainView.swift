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
                    IncomeView()
                } else {
                    OutcomeView()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Transactions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
