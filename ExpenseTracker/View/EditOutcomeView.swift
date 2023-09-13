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
            List {
                Section("Title") {
                    TextField("\(outcome.title!)", text: $title, axis: .vertical)
                }
                Section("Amount") {
                    TextField("\(outcome.amount)", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                
                Section("Date") {
                    DatePicker("When did you get the money?", selection: $date, in: ...Date(), displayedComponents: [.date])
                        .font(Font.custom("Fonzie", size: 15))
                }
            }
            .navigationTitle("Edit Outcome")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        DataController().editOutcomeTransaction(outcomeTrans: outcome, title: title, amount: amount, date: date, context:  moc)
                        dismiss()
                    }
                }
            }
            .task {
                title = outcome.title!
                amount = outcome.amount
                date = outcome.date!
            }
            .tint(Color("color4"))
            .font(Font.custom("Fonzie", size: 20))
        }
    }
}
