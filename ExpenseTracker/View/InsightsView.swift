//
//  ChartsView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI
import Charts

struct InsightsView: View {
    
    //MARK: Propreties
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var income : FetchedResults<Income>
    
    @ObservedObject var incomeChartViewModel : IncomeChartViewModel
    
    func getDate(date: Date)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
    
    var body: some View {
        NavigationStack {
            Chart(income) { inc in
                BarMark (
                    x: .value("Date", inc.date!),
                    y: .value("Amount", inc.amount)
                )
                .foregroundStyle(.red)
            }
            .navigationTitle("Insights")
        }
        .tint(Color("color4"))
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(incomeChartViewModel: IncomeChartViewModel(incomes: []))
    }
}
