//
//  ChartsView.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import SwiftUI

struct ChartsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Coming Soon!")
                    .font(Font.custom("Fonzie", size: 30))
            }
            .navigationTitle("Charts")
        }
        .tint(Color("color4"))
        .colorMultiply(Color("color1"))
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
