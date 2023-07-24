//
//  ContentView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/22/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var exercises: [Exercise]
    
    var body: some View {
        NavigationStack {
        ScrollView(.horizontal) {
                ForEach(exercises) { exercise in
                    ExerciseCardView()
                }
            }
            .navigationTitle("Exercise Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: NewExerciseView()) {
                        Text("Add")
                    }
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Exercise.self, inMemory: true)
}
