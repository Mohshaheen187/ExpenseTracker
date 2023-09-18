//
//  Currency.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 14.09.23.
//

import Foundation

enum Currency: String, CaseIterable {
    case usd = "United States Dollar (USD)"
    case eur = "Euro (EUR)"
    case jpy = "Japanese Yen (JPY)"
    case gbp = "British Pound Sterling (GBP)"
    case aud = "Australian Dollar (AUD)"
    case cad = "Canadian Dollar (CAD)"
    case chf = "Swiss Franc (CHF)"
    case cny = "Chinese Yuan (CNY)"
    case sek = "Swedish Krona (SEK)"
    case nzd = "New Zealand Dollar (NZD)"
    case jod = "Jordanian Dinar (JOD)"
    
    var iso : String {
        switch self {
        case .usd:
            return "USD"
        case .eur:
            return "EUR"
        case .jpy:
            return "JPY"
        case .gbp:
            return "GBP"
        case .aud:
            return "AUD"
        case .cad:
            return "CAD"
        case .chf:
            return "CHF"
        case .cny:
            return "CNY"
        case .sek:
            return "SEK"
        case .nzd:
            return "NZD"
        case .jod:
            return "JOD"
        }
    }
    
    var flag : String {
        switch self {
        case .usd:
            return "usa"
        case .eur:
            return "euro"
        case .jpy:
            return "japan"
        case .gbp:
            return "uk"
        case .aud:
            return "australia"
        case .cad:
            return "canada"
        case .chf:
            return "switzerland"
        case .cny:
            return "china"
        case .sek:
            return "sweden"
        case .nzd:
            return "new zealand"
        case .jod:
            return "jordan"
        }
    }
}
