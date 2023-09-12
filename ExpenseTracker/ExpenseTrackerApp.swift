//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 12.09.23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
