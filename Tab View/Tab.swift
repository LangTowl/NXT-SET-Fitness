//
//  Tab.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/5/23.
//

import Foundation

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
