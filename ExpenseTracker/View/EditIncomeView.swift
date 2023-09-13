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
            VStack(spacing: 25) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Title")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    TextField("\(income.title!)", text: $title, axis: .vertical)
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, style: StrokeStyle(lineWidth: 1))
                                .opacity(0.5)
                        }
                }
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Amount")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    TextField("\(income.amount)", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, style: StrokeStyle(lineWidth: 1))
                                .opacity(0.5)
                        }
                }
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Date")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    DatePicker("When did you get the money?", selection: $date, in: ...Date(), displayedComponents: [.date])
                }
                .padding([.leading, .trailing])
                
                Spacer()
            }
            .navigationTitle("Edit Income")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        DataController().editIncomeTransaction(incomeTrans: income, title: title, amount: amount, date: date, context:  moc)
                        dismiss()
                    }
                }
            }
            .task {
                title = income.title!
                amount = income.amount
                date = income.date!
            }
        }
    }
}
