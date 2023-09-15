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
    
    @State private var selectedCategory : Category = .car
    @State private var selectedCurrency : Currency = .aud
    
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
                
                Section("Category") {
                    Picker("Select a category", selection: $selectedCategory) {
                        ForEach(Category.allCases.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { category in
                            Label {
                                Text(category.description)
                            } icon: {
                                Image(systemName: category.imageName)
                                    .foregroundColor(category.imageColor)
                            }
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("Edit Transaction")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        DataController().editOutcomeTransaction(outcomeTrans: outcome, title: title, amount: amount, date: date, category: selectedCategory.rawValue, context:  moc)
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
