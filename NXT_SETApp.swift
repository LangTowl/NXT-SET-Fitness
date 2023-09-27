//
//  NXT_SETApp.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI

@main
struct NXT_SETApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Exercise.self])
    }
}
