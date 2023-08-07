//
//  ExerciseLibraryView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/5/23.
//

import SwiftUI

struct ExerciseLibraryView: View {
    
    @State var active_view: ExerciseType = .strength
    
    var body: some View {
        NavigationStack {
            
            Picker("Exercise type", selection: $active_view) {
                ForEach(ExerciseType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Group {
                switch active_view {
                case .strength:
                    Text("Boop")
                case .cardio:
                    Text("bop")
                }
            }
            .navigationTitle("Exercise Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: NewExerciseView()) {
                        Text("Add")
                            .foregroundStyle(Color("trailing"))
                            .bold()
                    }
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
