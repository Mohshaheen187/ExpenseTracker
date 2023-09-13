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
    
    @State private var addOutcome : Bool = false
    
    //MARK: BODY
    var body: some View {
        List {
            ForEach(outcome) { out in
                NavigationLink {
                    EditOutcomeView(outcome: out)
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(out.title!)
                                .font(.title2)
                                .bold()
                            Text("\(String(format: "%.2f", out.amount))")
                        }
                        Spacer()
                        Text(calcTimeSince(date: out.date!))
                    }
                }
            }
        }
        .listStyle(.inset)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addOutcome = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .sheet(isPresented: $addOutcome) {
                    AddOutcomeView()
                        .presentationDetents([.fraction(0.75)])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeView()
    }
}
