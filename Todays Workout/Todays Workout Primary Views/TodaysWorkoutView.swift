//
//  TodaysWorkoutView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 9/6/23.
//

import SwiftUI
import SwiftData

struct TodaysWorkoutView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<Program> {$0.active == true}) var programs: [Program]
    
    var active_program: Program? {
        if programs.count == 0 {
            return nil
        } else {
            return programs[0]
        }
    }
    
    var todays_workout: ProgramDay? {
        for i in 0...(active_program!.program_days.count - 1) {
            if active_program?.program_days[i].name == active_program!.active_day {
                return active_program?.program_days[i]
            }
        }
        
        return nil
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink(destination: Text("Start workout")) {
                    ZStack {
                        Circle()
                            .stroke(Color("leading"), lineWidth: 4)
                            .frame(height: start_button_diameter)
                        
                        VStack {
                            Image(systemName: "play.fill")
                                .font(.system(size: 100))
                                .foregroundStyle(Color("trailing"))
                            
                            Text(todays_workout?.name ?? "No program active")
                                .foregroundStyle(.white)
                                .opacity(0.5)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                HStack {
                    ExerciseInspectorStatBubbleView(value: count_total_sets(workout: todays_workout!), metric: "sets", icon: "number", icon_color: Color("leading"), description: "total sets")
                    
                    ExerciseInspectorStatBubbleView(value: count_total_reps(workout: todays_workout!), metric: "reps", icon: "number", icon_color: Color("trailing"), description: "total reps")
                }
                .padding(.horizontal)
                
                HStack {
                    ExerciseInspectorStatBubbleView(value: count_total_exercises(workout: todays_workout!), metric: "exercises", icon: "list.number", icon_color: Color("leading"), description: "total exercises")
                    
                    ExerciseInspectorStatBubbleView(value: aproximate_duration(workout: todays_workout!), metric: "minutes", icon: "clock", icon_color: Color("trailing"), description: "aprox. duration")
                }
                .padding(.horizontal)
            }
            .navigationTitle(active_program?.name ?? "No program active")
        }
    }
}
