//
//  OutcomeView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI

struct OutcomeView: View {
    
    //MARK: Propreties
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var outcome : FetchedResults<Outcome>
    
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var amount : Double = 0.0
    @State private var date : Date = Date()
    @Binding var outcomeBalance: Double
    
    @State private var searchText : String = ""
    
    var filteredOutcome : [Outcome] {
        if searchText.isEmpty {
            return Array(outcome)
        } else {
            return outcome.filter { inc in
                inc.title?.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
    
    var totalOutcomeBalance: Double {
        let existingAmounts = filteredOutcome.reduce(0.0) { $0 + $1.amount }
        outcomeBalance = existingAmounts + amount
        return outcomeBalance
    }
    
    //MARK: BODY
    var body: some View {
        List {
            Text("Total outcome balance: \(String(format: "%.2f", totalOutcomeBalance))")
            ForEach(filteredOutcome) { out in
                NavigationLink {
                    EditOutcomeView(outcome: out)
                } label: {
                    HStack(alignment: .center) {
                        Label {
                            Text(out.title!)
                                .font(Font.custom("Fonzie", size: 25))
                        } icon: {
                            Image(systemName: Category(rawValue: out.category ?? "")?.imageName ?? "questionmark.circle")
                                .foregroundColor(Category(rawValue: out.category!)?.imageColor ?? .gray)
                                .font(.system(size: 25))
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(calcTimeSince(date: out.date!))
                                .font(Font.custom("Fonzie", size: 15))
                                .foregroundColor(.secondary)
                            Text("\(String(format: "%.2f", out.amount))")
                                .font(Font.custom("Fonzie", size: 15))
                                .foregroundColor(.red)
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
            offsets.map { outcome[$0] }.forEach(moc.delete)
            DataController().saveTransaction(context: moc)
        }
    }
}
