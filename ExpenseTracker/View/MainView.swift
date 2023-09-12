//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

struct MainView: View {
    
    //MARK: Propreties
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var income : FetchedResults<Income>
    
    @State private var addNewIncome : Bool = false
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

