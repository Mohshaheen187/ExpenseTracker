//
//  IncomeView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

struct IncomeView: View {
    
    //MARK: Propreties
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var income : FetchedResults<Income>
    
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    
    @Binding var incomeBalance: Double
    
    @State private var searchText : String = ""
    
    var filteredIncome : [Income] {
        if searchText.isEmpty {
            return Array(income)
        } else {
            return income.filter { inc in
                inc.title?.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
    
    var totalIncomeBalance: Double {
        let existingAmounts = filteredIncome.reduce(0.0) { $0 + $1.amount }
        incomeBalance = existingAmounts + amount
        return incomeBalance
    }
    
    //MARK: BODY
    var body: some View {
        List {
            Text("Total income balance: \(String(format: "%.2f", totalIncomeBalance))")
            ForEach(filteredIncome) { inc in
                NavigationLink {
                    EditIncomeView(income: inc)
                } label: {
                    HStack(alignment: .center) {
                        Label {
                            Text(inc.title!)
                                .font(Font.custom("Fonzie", size: 25))
                        } icon: {
                            Image(systemName: Category(rawValue: inc.category ?? "")?.imageName ?? "questionmark.circle")
                                .foregroundColor(Category(rawValue: inc.category!)?.imageColor ?? .gray)
                                .font(.system(size: 25))
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(calcTimeSince(date: inc.date!))
                                .font(Font.custom("Fonzie", size: 15))
                                .foregroundColor(.secondary)
                            Text("\(String(format: "%.2f", inc.amount))")
                                .font(Font.custom("Fonzie", size: 15))
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .onDelete(perform: deleteTransaction)
        }
        .listStyle(.inset)
        .tint(Color("color4"))
        .searchable(text: $searchText)
    }
    
    private func deleteTransaction(offsets: IndexSet) {
        withAnimation {
            offsets.map { income[$0] }.forEach(moc.delete)
            DataController().saveTransaction(context: moc)
        }
    }
}
