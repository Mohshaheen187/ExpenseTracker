//
//  TabViews.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI

struct TabViews: View {
    
    @State private var selectedIndex : Int = 1
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            MainView()
                .tag(1)
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }
            
            InsightsView()
                .tag(2)
                .tabItem {
                    Label("Charts", systemImage: "chart.bar.xaxis")
                }
        }
        .tint(Color("color4"))
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
