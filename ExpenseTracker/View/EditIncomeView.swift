//
//  EditIncomeView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

struct EditIncomeView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    
    var income: FetchedResults<Income>.Element
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("\(income.title!)", text: $title)
                        .onAppear {
                            title = income.title!
                            amount = income.amount
                            date = income.date!
                        }
                    VStack {
                        Text("Amount: \(String(format: "%.2f", income.amount))")
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
                        DataController().editIncomeTransaction(incomeTrans: income, title: title, amount: amount, date: date, context:  moc)
                        dismiss()
                    }
                }
            }
        }
    }
}
