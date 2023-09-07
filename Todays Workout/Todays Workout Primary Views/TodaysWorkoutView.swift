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
            VStack {
                Spacer()
                
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
                
                Spacer()
            }
            .navigationTitle(active_program?.name ?? "No program active")
        }
    }
}
