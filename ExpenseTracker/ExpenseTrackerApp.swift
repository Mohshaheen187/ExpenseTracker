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
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            TabViews()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
