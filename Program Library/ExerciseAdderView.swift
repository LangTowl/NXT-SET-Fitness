//
//  ExerciseAdderView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/3/23.
//

import SwiftUI
import SwiftData

struct ExerciseAdderView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate {$0.type == "cardio" }) var cardio_exercises: [Exercise]
    @Query(filter: #Predicate {$0.type == "strength" }) var strength_exercises: [Exercise]
    
    // Cardio exercise filtered
    var running_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "running"}
    }
    
    var walking_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "walking"}
    }
    
    var swimming_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "swimming"}
    }
    
    var cycling_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "cycling"}
    }
    
    var rowing_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "rowing"}
    }
    
    var stairs_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "stairs"}
    }
    
    var other_cardio_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "other"}
    }
    
    // Strength exercise filtered
    var chest_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "chest"}
    }
    
    var back_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "back"}
    }
    
    var shoulder_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "shoulder"}
    }
    
    var tricep_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "tricep"}
    }
    
    var bicep_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "bicep"}
    }
    
    var forearm_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "forearm"}
    }
    
    var core_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "core"}
    }
    
    var quad_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "quad"}
    }
    
    var hamstring_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "hamstring"}
    }
    
    var glute_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "glute"}
    }
    
    var calve_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "calve"}
    }
    
    var other_strength_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "other"}
    }
    
    @Bindable var program_day: ProgramDay
    
    @State var focus: String = "cardio"
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Exercise's type", selection: $focus) {
                    ForEach(exercise_types, id: \.self) {
                        Text($0)
                    }
                    .navigationTitle("Adding to ")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
            .navigationTitle("Adding to \(program_day.name)")
            
            switch focus {
            case "cardio":
                List {
                    Section(header: Text("Running exercises")) {
                        if running_exercises.count == 0 {
                            Text("No running exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(running_exercises) { run in
                                Text(run.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(run)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Walking exercises")) {
                        if walking_exercises.count == 0 {
                            Text("No walking exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(walking_exercises) { walk in
                                Text(walk.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(walk)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Swimming exercises")) {
                        if swimming_exercises.count == 0 {
                            Text("No swimming exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(swimming_exercises) { swim in
                                Text(swim.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(swim)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Cycling exercises")) {
                        if cycling_exercises.count == 0 {
                            Text("No Cycling exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(cycling_exercises) { cycling in
                                Text(cycling.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(cycling)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Rowing exercises")) {
                        if rowing_exercises.count == 0 {
                            Text("No rowing exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(rowing_exercises) { row in
                                Text(row.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(row)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Stair exercises")) {
                        if stairs_exercises.count == 0 {
                            Text("No stair exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(stairs_exercises) { stair in
                                Text(stair.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(stair)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Other exercises")) {
                        if other_cardio_exercises.count == 0 {
                            Text("No other exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(other_cardio_exercises) { other in
                                Text(other.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(other)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }

                        }
                    }
                }
            case "strength":
                List {
                    Section(header: Text("Chest exercises")) {
                        if chest_exercises.count == 0 {
                            Text("No chest exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(chest_exercises) { chest in
                                Text(chest.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(chest)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Back exercises")) {
                        if back_exercises.count == 0 {
                            Text("No back exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(back_exercises) { back in
                                Text(back.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(back)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Shoulder exercises")) {
                        if shoulder_exercises.count == 0 {
                            Text("No shoulder exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(shoulder_exercises) { shoulder in
                                Text(shoulder.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(shoulder)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Tricep exercises")) {
                        if tricep_exercises.count == 0 {
                            Text("No tricep exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(tricep_exercises) { tricep in
                                Text(tricep.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(tricep)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Bicep exercises")) {
                        if bicep_exercises.count == 0 {
                            Text("No bicep exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(bicep_exercises) { bicep in
                                Text(bicep.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(bicep)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Forearm exercises")) {
                        if forearm_exercises.count == 0 {
                            Text("No forearm exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(forearm_exercises) { forearm in
                                Text(forearm.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(forearm)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Core exercises")) {
                        if core_exercises.count == 0 {
                            Text("No Core exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(core_exercises) { core in
                                Text(core.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(core)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Quad exercises")) {
                        if quad_exercises.count == 0 {
                            Text("No quad exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(quad_exercises) { quad in
                                Text(quad.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(quad)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Hamstring exercises")) {
                        if hamstring_exercises.count == 0 {
                            Text("No hamstring exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(hamstring_exercises) { hamstring in
                                Text(hamstring.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(hamstring)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Glute exercises")) {
                        if glute_exercises.count == 0 {
                            Text("No glute exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(glute_exercises) { glute in
                                Text(glute.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(glute)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Calve exercises")) {
                        if calve_exercises.count == 0 {
                            Text("No calve exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(calve_exercises) { calve in
                                Text(calve.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(calve)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Other exercises")) {
                        if other_strength_exercises.count == 0 {
                            Text("No other exercises created")
                                .opacity(0.5)
                        } else {
                            ForEach(other_strength_exercises) { other in
                                Text(other.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(other)
                                            try? model_context.save()
                                        }
                                        .tint(Color("blue_trailing"))
                                    }
                            }
                        }
                    }
                }
            default:
                EmptyView()
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
