//
//  NewExerciseView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/22/23.
//

import SwiftUI
import SwiftData

struct NewExerciseView: View {
    
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_new_exercise_view
    
    @State var name: String = ""
    @State var type: ExerciseType = .empty
    
    @State var cardio_type: CardioType = .empty
    @State var cardio_metric: CardioMetric = .empty
    @State var cardio_duration: Double?
    @State var cardio_distance: Double?
    
    @State var strength_primary: PrimaryMuscle = .empty
    @State var strength_secondary: String = ""
    @State var strength_starting_weight: Double?
    @State var strength_working_weight: Double?
    @State var strength_max_weight: Double?
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Name this exercise and choose it's type.")) {
                    TextField("Name", text: $name)
                    
                    Picker("Exercise's type", selection: $type) {
                        ForEach(exercise_types, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Group {
                    switch type {
                    case .cardio:
                        Section(footer: Text("Choose the type of cardio and how it's tracked.")) {
                            Picker("Cardio Type", selection: $cardio_type) {
                                ForEach(cardio_types, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.navigationLink)
                            
                            Picker("Cardio metric", selection: $cardio_metric) {
                                ForEach(cardio_metrics, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        switch cardio_metric {
                        case .distance:
                            Section(footer: Text("Enter the desired distance.")) {
                                TextField("Distance (mi.)", value: $cardio_distance, format: .number)
                            }
                        case .duration:
                            Section(footer: Text("Enter the desired duration.")) {
                                TextField("Duration (min.)", value: $cardio_duration, format: .number)
                            }
                        case .empty:
                            EmptyView()
                        }
                        
                    case .strength:
                        Section(footer: Text("Choose the primary and secondary muscle groups.")) {
                            Picker("Primary muscle", selection: $strength_primary) {
                                ForEach(primary_muscles, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.navigationLink)
                            
                            TextField("Secondary muscle", text: $strength_secondary)
                        }
                        
                        Section(footer: Text("Enter the starting, working, and max weight respectivly.")) {
                            HStack {
                                Text("Starting weight (lbs.)")
                                
                                Spacer()
                                
                                TextField("000", value: $strength_starting_weight, format: .number)
                                    .frame(width: UIScreen.main.bounds.width / 4)
                            }
                            
                            HStack {
                                Text("Working weight (lbs.)")
                                
                                Spacer()
                                
                                TextField("000", value: $strength_working_weight, format: .number)
                                    .frame(width: UIScreen.main.bounds.width / 4)
                            }
                            
                            HStack {
                                Text("Max weight (lbs.)")
                                
                                Spacer()
                                
                                TextField("000", value: $strength_max_weight, format: .number)
                                    .frame(width: UIScreen.main.bounds.width / 4)
                            }
                        }
                    case .empty:
                        EmptyView()
                    }
                }
            }
            .padding(.top)
            .navigationTitle("New Exercise")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_new_exercise_view()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        switch type {
                        case .cardio:
                            switch cardio_metric {
                            case .distance:
                                let new_exercise = Exercise(name: name, type: type, cardio_type: cardio_type, cardio_metric: cardio_metric, cardio_distance: cardio_distance ?? 0)
                                
                                model_context.insert(new_exercise)
                                
                                dismiss_new_exercise_view()
                            case .duration:
                                let new_exercise = Exercise(name: name, type: type, cardio_type: cardio_type, cardio_metric: cardio_metric, cardio_duration: cardio_duration ?? 0)
                                
                                model_context.insert(new_exercise)
                                
                                dismiss_new_exercise_view()
                            case .empty:
                                print("Error occurend in duration cardio exercise creation")
                            }
                        case .strength:
                            let new_exercise = Exercise(name: name, type: type, strength_primary: strength_primary, strength_secondary: strength_secondary, strength_starting_weight: strength_starting_weight ?? 0, strength_working_weight: strength_working_weight ?? 0, strength_max_weight: strength_max_weight ?? 0)
                            
                            model_context.insert(new_exercise)
                            
                            dismiss_new_exercise_view()
                        case .empty:
                            print("error occured in exercise creation")
                        }
                    }
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
//    ContentView()
//        .modelContainer(for: Exercise.self, inMemory: true)
    
    NewExerciseView()
        .modelContainer(for: Exercise.self, inMemory: true)
}
