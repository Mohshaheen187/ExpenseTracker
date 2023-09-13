//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

enum TransactionType {
    case income
    case outcome
}

struct MainView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @State private var addNewIncome : Bool = false
    @State private var selectedTransactionType : TransactionType = .income
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $selectedTransactionType) {
                    Text("Income").tag(TransactionType.income)
                    Text("Outcome").tag(TransactionType.outcome)
                }
                .pickerStyle(.segmented)
                
                if selectedTransactionType == .income {
                    IncomeView()
                } else {
                    OutcomeView()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Transactions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
/*
List {
    ForEach(income) { inc in
        NavigationLink {
            EditIncomeView(income: inc)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(inc.title!)")
                    Text("\(inc.date!, style: .date)")
                }
                Spacer()
                Text(calcTimeSince(date: inc.date!))
            }
        }
    }
    .onDelete(perform: deleteTransaction)
}
.navigationTitle("Add Income")
.toolbar {
    ToolbarItem(placement: .navigationBarLeading) {
        EditButton()
    }
    ToolbarItem(placement: .navigationBarTrailing) {
        Button {
            addNewIncome.toggle()
        } label: {
            Image(systemName: "plus.circle.fill")
        }
    }
}
.sheet(isPresented: $addNewIncome) {
    IncomeView()
        .presentationDragIndicator(.visible)
        .presentationDetents([.fraction(0.75)])
}
 */

