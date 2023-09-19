//
//  NewTransactionsTexts.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 19.09.23.
//

import Foundation

struct NewTransactionsTexts : Identifiable, Hashable {
    var id: Int
    var title: String
    var amount : String
    var date : String
}

let Transactions : [TransactionType : [NewTransactionsTexts]] = [
    .income: [
        NewTransactionsTexts(id: 1, title: "How did you get the money?", amount: "How much did you get?", date: "When did you get the money?")
    ],
    .outcome: [
        NewTransactionsTexts(id: 2, title: "How did you pay the money?", amount: "How much did you pay?", date: "When did you pay the money?")
    ]
]
