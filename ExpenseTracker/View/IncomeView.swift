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
    
    @State private var addIncome : Bool = false
    
    //MARK: BODY
    var body: some View {
        List {
            ForEach(income) { inc in
                NavigationLink {
                    EditIncomeView(income: inc)
                } label: {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text(inc.title!)
                                .font(Font.custom("Fonzie", size: 25))
                            Text("\(String(format: "%.2f", inc.amount))")
                                .font(Font.custom("Fonzie", size: 15))
                                .foregroundColor(.green)
                        }
                        Spacer()
                        Text(calcTimeSince(date: inc.date!))
                            .font(Font.custom("Fonzie", size: 15))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onDelete(perform: deleteTransaction)
        }
        .listStyle(.inset)
        .tint(Color("color4"))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addIncome = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .sheet(isPresented: $addIncome) {
                    AddIncomeView()
                        .presentationDetents([.fraction(0.5)])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
    
    private func deleteTransaction(offsets: IndexSet) {
        withAnimation {
            offsets.map { income[$0] }.forEach(moc.delete)
            DataController().saveTransaction(context: moc)
        }
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView()
    }
}

