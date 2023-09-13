//
//  EditOutcomeView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI

struct EditOutcomeView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    
    var outcome: FetchedResults<Outcome>.Element
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("\(outcome.title!)", text: $title)
                        .onAppear {
                            title = outcome.title!
                            amount = outcome.amount
                            date = outcome.date!
                        }
                    VStack {
                        Text("Amount: \(String(format: "%.2f", outcome.amount))")
                        TextField("Amount", value: $amount, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                    }
                    
                    DatePicker("Payment Day", selection: $date, displayedComponents: [.date])
                }
            }
            .navigationTitle("Edit Income")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Done") {
                        DataController().editOutcomeTransaction(outcomeTrans: outcome, title: title, amount: amount, date: date, context: moc)
                        dismiss()
                    }
                }
            }
        }
    }
}
