//
//  Preferences.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 18.09.23.
//

import SwiftUI

struct Preferences: View {
    
    //MARK: PROPRETIES
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var selectedFlag : Currency = .aud
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                Toggle("Color scheme", isOn: $isDarkMode)
                NavigationLink {
                    IncomeBalanceView()
                } label: {
                    Text("Income balance")
                }

                NavigationLink {
                    OutcomeBalanceView()
                } label: {
                    Text("Outcome balance")
                }

            }
            .navigationTitle("Preferences")
        }
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences()
    }
}

struct IncomeBalanceView : View {
    
    //MARK: PROPRETIES
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var income : FetchedResults<Income>
    @State private var selectedCurrency : Currency = .aud
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(income, id: \.self) { inc in
                    HStack {
                        Label {
                            Text(inc.title!)
                        } icon: {
                            Image(systemName: Category(rawValue: inc.category ?? "")?.imageName ?? "questionmark.circle")
                                .foregroundColor(Category(rawValue: inc.category!)?.imageColor ?? .gray)
                        }
                        Spacer()
                        Text("\(String(format: "%.2f", inc.amount) + inc.currency!)")
                    }
                }
            }
            .navigationTitle("Income Transactions")
        }
    }
}

struct OutcomeBalanceView : View {
    
    //MARK: PROPRETIES
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var outcome : FetchedResults<Outcome>
    @State private var selectedCurrency : Currency = .aud
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(outcome, id: \.self) { out in
                    HStack {
                        Label {
                            Text(out.title!)
                        } icon: {
                            Image(systemName: Category(rawValue: out.category ?? "")?.imageName ?? "questionmark.circle")
                                .foregroundColor(Category(rawValue: out.category!)?.imageColor ?? .gray)
                        }
                        Spacer()
                        Text("\(String(format: "%.2f", out.amount) + out.currency!)")
                    }
                }
            }
            .navigationTitle("Income Transactions")
        }
    }
}
