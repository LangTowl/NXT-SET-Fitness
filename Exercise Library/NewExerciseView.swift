//
//  NewExerciseView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/24/23.
//

import SwiftUI
import SwiftData

struct NewExerciseView: View {
    
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_new_exercise_view
    
    @State var name: String = ""
    @State var type: String = "cardio"
    
    @State var cardio_type: String = "running"
    @State var cardio_metric: String = "distance"
    
    @State var cardio_distance: Double?
    @State var cardio_duration: Double?
    
    @State var strength_primary: String = "chest"
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
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Group {
                    switch type {
                    case "cardio":
                        Section(footer: Text("Choose the type of cardio and how it's tracked.")) {
                            Picker("Cardio type", selection: $cardio_type) {
                                ForEach(cardio_types, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.navigationLink)
                            
                            Picker("Cardio metric", selection: $cardio_metric) {
                                ForEach(cardio_metrics, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Group {
                            switch cardio_metric {
                            case "distance":
                                Section(footer: Text("Enter the desired distance (mi.).")) {
                                    TextField("Distance", value: $cardio_distance, format: .number)
                                }
                            case "duration":
                                Section(footer: Text("Enter the desired duration (min.).")) {
                                    TextField("Duration", value: $cardio_duration, format: .number)
                                }
                            default:
                                EmptyView()
                            }
                        }
                    case "strength":
                        Section(footer: Text("Choose the primary and secondary muscle groups.")) {
                            Picker("Primary muscle", selection: $strength_primary) {
                                ForEach(primary_muscles, id: \.self) {
                                    Text($0)
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
                    default:
                        EmptyView()
                    }
                }
            }
            .navigationTitle("New Exercise")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        switch type {
                        case "cardio":
                            switch cardio_metric {
                            case "distance":
                                let new_exercise = Exercise(name: name, type: type, cardio_type: cardio_type, cardio_metric: cardio_metric, cardio_distance: cardio_distance!)
                                
                                model_context.insert(new_exercise)
                                
                                dismiss_new_exercise_view()
                            case "duration":
                                let new_exercise = Exercise(name: name, type: type, cardio_type: cardio_type, cardio_metric: cardio_metric, cardio_duration: cardio_duration!)
                                
                                model_context.insert(new_exercise)
                                
                                dismiss_new_exercise_view()
                            default:
                                print("ERROR No cardio metric type selected")
                            }
                        case "strength":
                            let new_exercise = Exercise(name: name, type: type, strength_primary: strength_primary, strength_secondary: strength_secondary, strength_starting_weight: strength_starting_weight!, strength_working_weight: strength_working_weight!, strength_max_weight: strength_max_weight!)
                            
                            model_context.insert(new_exercise)
                            
                            dismiss_new_exercise_view()
                        default:
                            print("ERROR No exercise type selected.")
                        }
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    NewExerciseView()
}
