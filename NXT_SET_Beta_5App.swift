//
//  NXT_SET_Beta_5App.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/5/23.
//

import SwiftUI
import SwiftData

@main
struct NXT_SET_Beta_5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Exercise.self, Program.self, ProgramDay.self])
    }
}
