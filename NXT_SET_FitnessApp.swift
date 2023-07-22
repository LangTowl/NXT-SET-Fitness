//
//  NXT_SET_FitnessApp.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/22/23.
//

import SwiftUI
import SwiftData

@main
struct NXT_SET_FitnessApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
