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
    
    @State private var selectedCategory : Category = .health
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                Section("Title") {
                    TextField("\(income.title!)", text: $title, axis: .vertical)
                }
                
                Section("Amount") {
                    TextField("\(income.amount)", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                
                Section("Date") {
                    DatePicker("When did you get the money?", selection: $date, in: ...Date(), displayedComponents: [.date])
                        .font(Font.custom("Fonzie", size: 15))
                }
                
                Section("Category") {
                    Picker("Select a category", selection: $selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Label {
                                Text(category.rawValue.capitalized)
                                    .tag(category.rawValue)
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
                        DataController().editIncomeTransaction(incomeTrans: income, title: title, amount: amount, date: date, category: selectedCategory.rawValue, context:  moc)
                        dismiss()
                    }
                }
            }
            .task {
                title = income.title!
                amount = income.amount
                date = income.date!
            }
            .tint(Color("color4"))
            .font(Font.custom("Fonzie", size: 20))
        }
    }
}
