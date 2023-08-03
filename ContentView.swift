//
//  ContentView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/24/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State var active_tab: Tab = .program_library
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Group {
                    switch active_tab {
                    case .program_library:
                        ProgramLibrary()
                    case .exercise_library:
                        ExerciseLibrary()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack {
                    Spacer()
                    
                    Button {
                        active_tab = .program_library
                    } label: {
                        Image(systemName: "clipboard")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        active_tab = .exercise_library
                    } label: {
                        Image(systemName: "checklist.unchecked")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                }
                .frame(height: 50)
                .background {
                    Color.clear
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .dark)
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
