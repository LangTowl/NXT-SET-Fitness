//
//  Tab.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import Foundation
import SwiftUI

enum Tab: String {
    case account_page
    case exercises_page
    case program_page
    case workout_page
}

struct TabItem: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var tab: Tab
}

let tab_items: [TabItem] = [
    TabItem(name: "program", icon: "clipboard", tab: .account_page),
    TabItem(name: "exercise", icon: "checklist.unchecked", tab: .account_page),
    TabItem(name: "workout", icon: "dumbbell", tab: .account_page),
    TabItem(name: "account", icon: "person", tab: .account_page),
]
