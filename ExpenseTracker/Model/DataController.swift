//
//  DataController.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "ExpensesModel")
    
    init() {
        container.loadPersistentStores() { desc, error in
            if let error = error {
                print("Failed to load data: \(error.localizedDescription)")
            }
        }
    }
    
    func saveTransaction(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Transaction saved!!")
        } catch {
            print("Failed to save!!")
        }
    }
    
    func addIncome(title: String, amount: Double, date: Date, category: String, context: NSManagedObjectContext) {
        let incomeTransaction = Income(context: context)
        
        incomeTransaction.id = UUID()
        incomeTransaction.title = title
        incomeTransaction.amount = amount
        incomeTransaction.date = date
        incomeTransaction.category = category
        
        saveTransaction(context: context)
    }
    
    func addOutcome(title: String, amount: Double, date: Date, category: String, context: NSManagedObjectContext) {
        let outcomeTransaction = Outcome(context: context)
        
        outcomeTransaction.id = UUID()
        outcomeTransaction.title = title
        outcomeTransaction.amount = amount
        outcomeTransaction.date = date
        outcomeTransaction.category = category
        
        saveTransaction(context: context)
    }
    
    func editIncomeTransaction(incomeTrans: Income, title: String, amount: Double, date: Date, category: String, context: NSManagedObjectContext) {
        incomeTrans.title = title
        incomeTrans.amount = amount
        incomeTrans.date = date
        incomeTrans.category = category
        
        saveTransaction(context: context)
    }
    
    func editOutcomeTransaction(outcomeTrans: Outcome, title: String, amount: Double, date: Date, category: String, context: NSManagedObjectContext) {
        outcomeTrans.title = title
        outcomeTrans.amount = amount
        outcomeTrans.date = date
        outcomeTrans.category = category
        
        saveTransaction(context: context)
    }
}
