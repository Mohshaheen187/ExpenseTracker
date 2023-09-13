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
    case gym
    
    var imageName: String {
        switch self {
        case .health:
            return "bandage.fill"
        case .car:
            return "car.fill"
        case .food:
            return "fork.knife"
        case .transport:
            return "bus.fill"
        case .education:
            return "graduationcap.fill"
        case .gym:
            return "dumbbell.fill"
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
        case .gym:
            return Color.gray
        }
    }
}
