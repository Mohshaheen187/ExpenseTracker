//
//  Category.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    case health
    case car
    case food
    case transport
    case education
    case groceries
    case sport
    case gym
    case money
    case shopping
    case gift
    case phone
    case house
    case personalCare
    
    var description: String {
        switch self {
        case .health:
            return "Health"
        case .car:
            return "Car"
        case .food:
            return "Food"
        case .transport:
            return "Transport"
        case .education:
            return "Education"
        case .groceries:
            return "Groceries"
        case .sport:
            return "Sports"
        case .gym:
            return "Gym"
        case .money:
            return "Money"
        case .shopping:
            return "Online Shopping"
        case .gift:
            return "Gifts"
        case .phone:
            return "Communication"
        case .house:
            return "Home Stuff"
        case .personalCare:
            return "Personal Care"
        }
    }
    
    var imageName: String {
        switch self {
        case .health:
            return "cross.case.fill"
        case .car:
            return "car.fill"
        case .food:
            return "fork.knife"
        case .transport:
            return "bus.fill"
        case .education:
            return "graduationcap.fill"
        case .sport:
            return "sportscourt.fill"
        case .gym:
            return "dumbbell.fill"
        case .money:
            return "centsign.circle.fill"
        case .groceries:
            return "basket.fill"
        case .shopping:
            return "creditcard.fill"
        case .gift:
            return "gift.fill"
        case .phone:
            return "phone.fill"
        case .house:
            return "house.fill"
        case .personalCare:
            return "figure.mind.and.body"
        }
    }
    
    var imageColor: Color {
        switch self {
        case .health:
            return Color.blue
        case .car:
            return Color.red
        case .food:
            return Color.orange
        case .transport:
            return Color.green
        case .education:
            return Color.primary
        case .sport:
            return Color.green
        case .gym:
            return Color.gray
        case .money:
            return Color.green
        case .groceries:
            return Color.teal
        case .shopping:
            return Color.indigo
        case .gift:
            return Color.yellow
        case .phone:
            return Color.cyan
        case .house:
            return Color.brown
        case .personalCare:
            return Color.gray
        }
    }
}
