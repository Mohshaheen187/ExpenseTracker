//
//  IncomeView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

struct IncomeView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title, axis: .vertical)
                    VStack {
                        Text("Amount: \(String(format: "%.2f", amount))")
                        Slider(value: $amount, in: 0...1000, step: 1)
                    }
                    
                    DatePicker("Payment Day", selection: $date, displayedComponents: [.date])
                }
            }
            .navigationTitle("Add new income")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Submit") {
                        DataController().addIncome(title: title, amount: amount, date: date, context: moc)
                        dismiss()
                    }
                }
            }
        }
        .tint(Color("color4"))
        .colorMultiply(Color("color1"))
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView()
    }
}


