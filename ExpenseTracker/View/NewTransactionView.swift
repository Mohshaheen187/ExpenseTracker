//
//  NewTransactionView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 16.09.23.
//

import SwiftUI

struct NewTransactionView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    @State private var isIncomeAdded : Bool = false
    
    @State private var presentAlert : AlertsHandling?
    @State private var selectedCategory: Category = .car
    @Binding var transactionType : TransactionType
    
    @Binding var navigationTitle : String
    
    var body: some View {
        NavigationStack {
            List {
                if transactionType == .income {
                    ForEach(Transactions[.income] ?? [], id: \.self) { inc in
                        Section("Title") {
                            TextField(inc.title, text: $title, axis: .vertical)
                                .scrollDismissesKeyboard(.interactively)
                        }
                        Section("Amount") {
                            TextField(inc.amount, value: $amount, formatter: NumberFormatter())
                                .scrollDismissesKeyboard(.interactively)
                        }
                        Section("Date") {
                            DatePicker(inc.date, selection: $date, in: ...Date(), displayedComponents: [.date])
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
                } else {
                    ForEach(Transactions[.outcome] ?? [], id: \.self) { out in
                        Section("Title") {
                            TextField(out.title, text: $title, axis: .vertical)
                                .scrollDismissesKeyboard(.interactively)
                        }
                        Section("Amount") {
                            TextField(out.amount, value: $amount, formatter: NumberFormatter())
                                .scrollDismissesKeyboard(.interactively)
                        }
                        Section("Date") {
                            DatePicker(out.date, selection: $date, in: ...Date(), displayedComponents: [.date])
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
                }
            }
            .navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        if transactionType == .income {
                            DataController().addIncome(title: title, amount: amount, date: date, category: selectedCategory.rawValue, context: moc)
                            dismiss()
                        } else {
                            DataController().addOutcome(title: title, amount: amount, date: date, category: selectedCategory.rawValue, context: moc)
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionView(transactionType: .constant(.income), navigationTitle: .constant("New transaction"))
    }
}
