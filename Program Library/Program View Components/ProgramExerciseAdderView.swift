//
//  ProgramExerciseAdderView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/9/23.
//

import SwiftUI
import SwiftData

struct ProgramExerciseAdderView: View {
    
    @State var active_view: ExerciseType = .strength
    @State var show_popover: Bool = false
    
    @Bindable var program_day: ProgramDay
    var passed_context: ModelContext
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_exercise_adder
    
    @Query private var exercises: [Exercise]
    
    var chest_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.chest.rawValue}
    }
    
    var back_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.back.rawValue}
    }
    
    var shoulder_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.shoulder.rawValue}
    }
    
    var tricep_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.tricep.rawValue}
    }
    
    var bicep_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.bicep.rawValue}
    }
    
    var forearm_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.forearm.rawValue}
    }
    
    var core_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.core.rawValue}
    }
    
    var quad_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.quad.rawValue}
    }
    
    var hamstring_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.hamstring.rawValue}
    }
    
    var glute_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.glute.rawValue}
    }
    
    var calve_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.calve.rawValue}
    }
    
    var other_strength_exercises: [Exercise] {
        exercises.filter { $0.primary_muscle == PrimaryMuscle.other.rawValue}
    }
    
    var running_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.running.rawValue}
    }
    
    var walking_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.walking.rawValue}
    }
    
    var swimming_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.swimming.rawValue}
    }
    
    var cycling_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.cycling.rawValue}
    }
    
    var rowing_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.rowing.rawValue}
    }
    
    var stairs_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.stairs.rawValue}
    }
    
    var other_cardio_exercises: [Exercise] {
        exercises.filter { $0.cardio_type == CardioType.other.rawValue}
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    withAnimation {
                        active_view = .strength
                    }
                } label: {
                    Text("Strength")
                        .font(.largeTitle).bold()
                        .foregroundStyle(active_view == .strength ? .white : .white.opacity(0.5))
                }
                .buttonStyle(PlainButtonStyle())
                
                Button {
                    withAnimation {
                        active_view = .cardio
                    }
                } label: {
                    Text("Cardio")
                        .font(.largeTitle).bold()
                        .foregroundStyle(active_view == .cardio ? .white : .white.opacity(0.5))
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .padding(.horizontal)
            
            List {
                switch active_view {
                case .strength:
                    Section(header: Text("Chest exercises")) {
                        if chest_exercises.count == 0 {
                            Text("No chest exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(chest_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            program_day.exercises.append(AddedExercise(
                                                name: exercise.name,
                                                type: exercise.type,
                                                primary_muscle: exercise.primary_muscle ?? "nil",
                                                secondary_muscle: exercise.secondary_muscle ?? "nil",
                                                starting_weight: exercise.starting_weight ?? 0,
                                                working_weight: exercise.working_weight ?? 0,
                                                max_weight: exercise.max_weight ?? 0
                                            ))
                                            
                                            try? model_context.save()
                                            
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Back exercises")) {
                        if back_exercises.count == 0 {
                            Text("No back exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(back_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Shoulder exercises")) {
                        if shoulder_exercises.count == 0 {
                            Text("No shoulder exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(shoulder_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Tricep exercises")) {
                        if tricep_exercises.count == 0 {
                            Text("No tricep exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(tricep_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Bicep exercises")) {
                        if bicep_exercises.count == 0 {
                            Text("No bicep exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(bicep_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Forearm exercises")) {
                        if forearm_exercises.count == 0 {
                            Text("No forearm exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(forearm_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Core exercises")) {
                        if core_exercises.count == 0 {
                            Text("No core exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(core_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Quad exercises")) {
                        if quad_exercises.count == 0 {
                            Text("No quad exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(quad_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Hamstring exercises")) {
                        if hamstring_exercises.count == 0 {
                            Text("No hamstring exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(hamstring_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Glute exercises")) {
                        if glute_exercises.count == 0 {
                            Text("No glute exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(glute_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Calve exercises")) {
                        if calve_exercises.count == 0 {
                            Text("No calve exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(calve_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Other exercises")) {
                        if other_strength_exercises.count == 0 {
                            Text("No other exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(other_strength_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                case .cardio:
                    Section(header: Text("Running exercises")) {
                        if running_exercises.count == 0 {
                            Text("No running exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(running_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Walking exercises")) {
                        if walking_exercises.count == 0 {
                            Text("No walking exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(walking_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Swimming exercises")) {
                        if swimming_exercises.count == 0 {
                            Text("No swimming exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(swimming_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Cycling exercises")) {
                        if running_exercises.count == 0 {
                            Text("No cycling exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(cycling_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Rowing exercises")) {
                        if rowing_exercises.count == 0 {
                            Text("No running exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(rowing_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Stairs exercises")) {
                        if stairs_exercises.count == 0 {
                            Text("No running exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(stairs_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                    
                    Section(header: Text("Other exercises")) {
                        if other_cardio_exercises.count == 0 {
                            Text("No running exercises")
                                .opacity(0.5)
                        } else {
                            ForEach(other_cardio_exercises) { exercise in
                                Text(exercise.name)
                                    .swipeActions {
                                        Button("Add") {
                                            show_popover.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                show_popover.toggle()
                                            }
                                        }
                                        .tint(Color("trailing"))
                                    }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_exercise_adder()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss_exercise_adder()
                    } label: {
                        Text("Done")
                            .foregroundStyle(Color("trailing"))
                            .bold()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Appending to \(program_day.name)")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $show_popover) {
                NavigationStack {
                    Text("Exercise added to \(program_day.name)")
                        .bold()
                }
                .presentationDetents([.fraction(0.1)])
                .environment(\.colorScheme, .dark)
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

