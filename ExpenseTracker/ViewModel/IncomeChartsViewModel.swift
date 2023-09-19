//
//  IncomeChartsViewModel.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 19.09.23.
//

import Foundation
import SwiftUI
import Combine

class IncomeChartViewModel: ObservableObject {
    @Published var incomeData: [(Category, Double)] = []
    
    init(incomes: [Income]) {
        // Group incomes by category and calculate total income for each category
        let groupedIncomes = Dictionary(grouping: incomes, by: { $0.category })
        
        // Map the grouped data to the desired format (Category, Double)
        incomeData = groupedIncomes.compactMap { (categoryString, incomes) in
            guard let category = Category(rawValue: categoryString!) else {
                return nil // Skip invalid categories
            }
            
            let totalIncome = incomes.map { $0.amount }.reduce(0, +)
            return (category, totalIncome)
        }
    }
}

let sampleIncomeData : [Income] = []
