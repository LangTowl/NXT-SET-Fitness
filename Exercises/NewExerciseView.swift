//
//  NewExerciseView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI
import SwiftData

struct NewExerciseView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    
    // Enviromental variables
    @Environment(\.dismiss) var dismiss_new_exercise_view
    
    // New exercise variables
    @State private var name: String = ""
    @State private var type: ExerciseType = .strength
    
    // New exercise strength variables
    @State private var primary_muscle: PrimaryMuscle = .chest
    @State private var secondary_muscle: String = ""
    @State private var starting_weight: Double?
    @State private var working_weight: Double?
    @State private var max_weight: Double?
    
    // New exercise cardio variables
    @State private var cardio_type: CardioType = .distance
    @State private var cardio_exercise: CardioExercise = .walking
    @State private var cardio_metric: Double?
    
    // Pased variables
    @Bindable var user: User
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Enter desired exercise name.")) {
                    TextField("Name", text: $name)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Select exercise type.")) {
                    Picker("Slect exercise type.", selection: $type) {
                        ForEach(ExerciseType.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                switch type {
                case .strength:
                    Section(footer: Text("Select primary muscle type.")) {
                        Picker("Primary muscle:", selection: $primary_muscle) {
                            ForEach(PrimaryMuscle.allCases, id: \.self) { muscle in
                                Text(muscle.rawValue)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section(footer: Text("Enter secondary muscle type.")) {
                        TextField("Secondary", text: $secondary_muscle)
                            .autocapitalization(.none)
                    }
                    
                    Section(footer: Text("Enter starting weight. (lbs.)")) {
                        TextField("Starting", value: $starting_weight, format: .number)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Enter working weight. (lbs.)")) {
                        TextField("Working", value: $working_weight, format: .number)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Enter max weight. (lbs.)")) {
                        TextField("Max", value: $max_weight, format: .number)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                    }
                case .cardio:
                    Section(footer: Text("Select cardio type.")) {
                        Picker("Cardio type:", selection: $cardio_type) {
                            ForEach(CardioType.allCases, id: \.self) { cardio in
                                Text(cardio.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(footer: Text("Select cardio exercise.")) {
                        Picker("Cardio exercise:", selection: $cardio_exercise) {
                            ForEach(CardioExercise.allCases, id: \.self) { exercise in
                                Text(exercise.rawValue)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section(footer: Text("Enter cardio \(cardio_type == .distance ? "distance" : "duration"). (\(cardio_type == .distance ? "miles" : "minutes"))")) {
                        TextField("\(cardio_type == .distance ? "Distance" : "Duration")", value: $cardio_metric, format: .number)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                    }
                }
            }
            .navigationTitle("New Exercise")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        switch type {
                        case .strength:
                            if name != "" && secondary_muscle != "" && starting_weight != nil && working_weight != nil && max_weight != nil {
                                let new_strength_exercise = Exercise(name: name, type: type, primary_muscle: primary_muscle, secondary_muscle: secondary_muscle, starting_weight: starting_weight ?? 0, working_weight: working_weight ?? 0, max_weight: max_weight ?? 0)
                                
                                user.exercises.append(new_strength_exercise)
                                
                                dismiss_new_exercise_view()
                            }
                        case .cardio:
                            if name != "" && cardio_metric != nil {
                                let new_cardio_exercise = Exercise(name: name, type: type, cardio_type: cardio_type, cardio_exercise: cardio_exercise, cardio_metric: cardio_metric ?? 0)
                                
                                user.exercises.append(new_cardio_exercise)
                                
                                dismiss_new_exercise_view()
                            }
                        }
                    } label: {
                        switch type {
                        case .strength:
                            if name != "" && secondary_muscle != "" && starting_weight != nil && working_weight != nil && max_weight != nil {
                                Text("Finish")
                            } else {
                                Text("Finish")
                                    .foregroundStyle(.gray)
                            }
                        case .cardio:
                            if name != "" && cardio_metric != nil {
                                Text("Finish")
                            } else {
                                Text("Finish")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    NewExerciseView()
//}
