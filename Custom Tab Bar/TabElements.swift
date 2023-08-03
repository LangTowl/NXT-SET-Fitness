//
//  TabElements.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/1/23.
//

import Foundation
import SwiftUI

enum Tab: String {
    case program_library
    case exercise_library
}

struct TabItem: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var tab: Tab
}

let tab_items: [TabItem] = [
    TabItem(name: "program library", icon: "clipboard", tab: .program_library),
    TabItem(name: "exercise library", icon: "checklist.unchecked", tab: .exercise_library)
]
