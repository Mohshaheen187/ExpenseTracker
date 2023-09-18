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
    
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                Toggle("Color scheme", isOn: $isDarkMode)
                Text("Income Balance")
                Text("Outcome Balance")
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
