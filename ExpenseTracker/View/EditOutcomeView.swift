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
            VStack(spacing: 25) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Title")
                        .foregroundColor(.secondary)
                        .bold()
                    TextField("\(outcome.title!)", text: $title, axis: .vertical)
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("color4"), style: StrokeStyle(lineWidth: 1))
                                .opacity(0.5)
                        }
                }
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Amount")
                        .foregroundColor(.secondary)
                        .bold()
                    TextField("\(outcome.amount)", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("color4"), style: StrokeStyle(lineWidth: 1))
                                .opacity(0.5)
                        }
                }
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Date")
                        .foregroundColor(.secondary)
                        .bold()
                    DatePicker("When did you get the money?", selection: $date, in: ...Date(), displayedComponents: [.date])
                        .font(Font.custom("Fonzie", size: 15))
                }
                .padding([.leading, .trailing])
                
                Spacer()
            }
            .navigationTitle("Edit Outcome")
            .tint(Color("color4"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        DataController().editOutcomeTransaction(outcomeTrans: outcome, title: title, amount: amount, date: date, context: moc)
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
