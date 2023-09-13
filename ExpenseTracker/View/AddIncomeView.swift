//
//  AddNewTransactionView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI

struct AddIncomeView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    @State private var isIncomeAdded : Bool = false
    
    @State private var presentAlert : AlertsHandling?
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                newIncomeComponents(title: $title, amount: $amount, date: $date)
            }
            .navigationTitle("Add New Income")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        if title.isEmpty {
                            presentAlert = AlertsHandling(id: 1, title: "Something wrong!", message: "Please check the information again")
                        } else {
                            DataController().addIncome(title: title, amount: amount, date: date, context: moc)
                            DataController().saveTransaction(context: moc)
                        }
                    }
                    .alert(item: $presentAlert) { alert in
                        Alert(
                            title: Text(alert.title),
                            message: Text(alert.message)
                        )
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

struct AddNewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddIncomeView()
    }
}

struct newIncomeComponents : View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @Binding var title : String
    @Binding var amount : Double
    @Binding var date : Date
    
    //MARK: BODY
    var body: some View {
        VStack(spacing: 25) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Title")
                    .font(.headline)
                    .foregroundColor(.secondary)
                TextField("Where did you get the money?", text: $title, axis: .vertical)
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
                TextField("How much did you received?", value: $amount, formatter: NumberFormatter())
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
    }
}
