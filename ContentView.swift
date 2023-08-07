//
//  ContentView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var active_tab: Tab = .exercise_library
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Group {
                    switch active_tab {
                    case .program_library:
                        Text("Program Library")
                    case .exercise_library:
                        ExerciseLibraryView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack {
                    Spacer()
                    
                    Button {
                        active_tab = .program_library
                    } label: {
                        Image(systemName: active_tab == .program_library ? "clipboard.fill" : "clipboard")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        active_tab = .exercise_library
                    } label: {
                        Image(systemName: active_tab == .exercise_library ? "checklist.checked" : "checklist.unchecked")
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
}
