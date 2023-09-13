//
//  Category.swift
//  ExpenseTracker
//
//  Created by Mohammed Shaheen on 13.09.23.
//

import Foundation

enum Category: String, CaseIterable {
    case health
    case car
    case food
    case transport
    case education
    case gym
    
    var imageName: String {
        switch self {
        case .health:
            return "bandage"
        case .car:
            return "car"
        case .food:
            return "fork.knife"
        case .transport:
            return "bus"
        case .education:
            return "graduationcap.fill"
        case .gym:
            return "dumbbell.fill"
        }
    }
}
