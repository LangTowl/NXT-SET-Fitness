//
//  ProgramInspectorView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import SwiftUI

struct ProgramInspectorView: View {
    
    // Passed variable
    @Bindable var program: Program
    
    // State variables
    @State var focus: UUID = UUID()
    
    // Computed properties
    var ordered_days: [ProgramDay] {
        program.program_days.sorted(by: { $0.index < $1.index })
    }
    
    var focused_day: ProgramDay {
        for i in 0...(ordered_days.count - 1) {
            if ordered_days[i].id == focus {
                return ordered_days[i]
            }
        }
        
        return ordered_days[0]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(ordered_days, id: \.self) { day in
                        Button {
                            focus = day.id
                        } label: {
                            if focus == day.id {
                                Text(day.name)
                                    .foregroundStyle(.blue)
                                    .bold()
                            } else {
                                Text(day.name)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                Text(focused_day.name)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                NavigationLink(destination: ProgramExerciseAdderView(day: focused_day)) {
                    Text("Add Exercises")
                }
            }
            .padding(.horizontal)
            
            Group {
                if focused_day.exercises.isEmpty {
                    VStack {
                        Spacer()
                        
                        Text("No exercises have been added to this day.")
                            .font(.title3)
                        Image(systemName: "dumbbell")
                            .foregroundStyle(.red)
                        
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(focused_day.exercises, id: \.self) { exercise in
                            Text(exercise.name)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(program.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProgramSettingsView(program: program)) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

//#Preview {
//    ProgramInspectorView()
//}
