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
    @AppStorage("selectedCurrency") private var selectedCurrency: Currency = .aud // Use AppStorage
    
    
    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker(selection: $selectedCurrency) {
                        ForEach(Currency.allCases.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { currency in
                            Text(currency.iso)
                                .tag(currency)
                        }
                    } label: {
                        Text("Cuurencies")
                    }
                    .tint(Color("color4"))
                    .font(Font.custom("Fonzie", size: 20))
                }
            }
            .tint(Color("color4"))
            .font(Font.custom("Fonzie", size: 20))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
