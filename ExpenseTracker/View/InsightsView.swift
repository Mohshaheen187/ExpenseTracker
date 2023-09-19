//
//  ChartsView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI

struct InsightsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Coming Soon!")
                    .font(Font.custom("Fonzie", size: 30))
            }
            .navigationTitle("Charts")
        }
        .tint(Color("color4"))
        .font(Font.custom("Fonzie", size: 20))
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
    }
}
