//
//  ContentView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/24/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var model_context
    @Query var exercises: [Exercise]
    
    @State var test_number: Int = 0
    @State var test_string: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ExerciseLibrary()
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Exercise.self, inMemory: true)
}
