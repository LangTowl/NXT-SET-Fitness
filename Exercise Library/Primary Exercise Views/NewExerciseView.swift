//
//  NewExerciseView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/5/23.
//

import SwiftUI
import SwiftData

struct NewExerciseView: View {
    
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_new_exercise_view
    
    @State private var name: String = ""
    @State private var type: ExerciseType = .strength
    
    @State private var primary_muscle: PrimaryMuscle = .chest
    @State private var secondary_muscle: String = ""
    @State private var starting_weight: Double?
    @State private var working_weight: Double?
    @State private var max_weight: Double?
    
    @State private var cardio_type: CardioType = .running
    @State private var cardio_metric: CardioMetric = .distance
    @State private var distance: Double?
    @State private var duration: Double?
    
    var is_form_complete: Bool {
        if name != "" {
            switch type {
            case .strength:
                if secondary_muscle != "" {
                    if starting_weight != nil && working_weight != nil && max_weight != nil {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            case .cardio:
                switch cardio_metric {
                case .distance:
                    if distance != nil {
                        return true
                    } else {
                        return false
                    }
                case .duration:
                    if duration != nil {
                        return true
                    } else {
                        return false
                    }
                }
            }
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                Form {
                    Section(footer: Text("Name this exercise and choose it's type.")) {
                        TextField("Name", text: $name)
                        
                        Picker("Select exercise type", selection: $type) {
                            ForEach(ExerciseType.allCases, id: \.self) { type in
                                Text(type.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Group {
                        switch type {
                        case .strength:
                            Section(footer: Text("Choose the primary and secondary muscle for this exercise.")) {
                                Picker("Primary muscle", selection: $primary_muscle) {
                                    ForEach(PrimaryMuscle.allCases, id: \.self) { muscle in
                                        Text(muscle.rawValue)
                                    }
                                }
                                .pickerStyle(.navigationLink)
                                
                                TextField("Secondary muscle", text: $secondary_muscle)
                            }
                            
                            Section(footer: Text("Enter the starting, working, and max weight respectivly.")) {
                                HStack {
                                    Text("Starting weight (lbs.)")
                                    
                                    Spacer()
                                    
                                    TextField("0.0", value: $starting_weight, format: .number)
                                        .frame(width: UIScreen.main.bounds.width / 4)
                                        .keyboardType(.numberPad)
                                }
                                
                                HStack {
                                    Text("Working weight (lbs.)")
                                    
                                    Spacer()
                                    
                                    TextField("0.0", value: $working_weight, format: .number)
                                        .frame(width: UIScreen.main.bounds.width / 4)
                                        .keyboardType(.numberPad)
                                }
                                
                                HStack {
                                    Text("Max weight (lbs.)")
                                    
                                    Spacer()
                                    
                                    TextField("0.0", value: $max_weight, format: .number)
                                        .frame(width: UIScreen.main.bounds.width / 4)
                                        .keyboardType(.numberPad)
                                }
                            }
                        case .cardio:
                            Section(footer: Text("Choose the type of cardio and how it's tracked.")) {
                                Picker("Cardio type", selection: $cardio_type) {
                                    ForEach(CardioType.allCases, id: \.self) { type in
                                        Text(type.rawValue)
                                    }
                                }
                                .pickerStyle(.navigationLink)
                                
                                Picker("Cardio metric", selection: $cardio_metric) {
                                    ForEach(CardioMetric.allCases, id: \.self) { metric in
                                        Text(metric.rawValue)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                            
                            switch cardio_metric {
                            case .distance:
                                Section(footer: Text("Enter the desired distance in miles.")) {
                                    TextField("Distance", value: $distance, format: .number)
                                        .keyboardType(.numberPad)
                                }
                            case .duration:
                                Section(footer: Text("Enter the desired duration in minutes.")) {
                                    TextField("Duration", value: $duration, format: .number)
                                        .keyboardType(.numberPad)
                                }
                            }
                        }
                    }
                }
                
                Text("is form complete: \(String(is_form_complete))")
            }
            .navigationTitle("New Exercise")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if is_form_complete == true {
                            switch type {
                            case .strength:
                                let new_exercise = Exercise(name: name, type: type.rawValue, primary_muscle: primary_muscle.rawValue, secondary_muscle: secondary_muscle, starting_weight: starting_weight ?? 0, working_weight: working_weight ?? 0, max_weight: max_weight ?? 0)
                                
                                model_context.insert(new_exercise)
                                
                                dismiss_new_exercise_view()
                            case .cardio:
                                switch cardio_metric {
                                case .distance:
                                    let new_exercise = Exercise(name: name, type: type.rawValue, cardio_type: cardio_type.rawValue, cardio_metric: cardio_metric.rawValue, distance: distance ?? 0)
                                    
                                    model_context.insert(new_exercise)
                                    
                                    dismiss_new_exercise_view()
                                case .duration:
                                    let new_exercise = Exercise(name: name, type: type.rawValue, cardio_type: cardio_type.rawValue, cardio_metric: cardio_metric.rawValue, duration: duration ?? 0)
                                    
                                    model_context.insert(new_exercise)
                                    
                                    dismiss_new_exercise_view()
                                }
                            }
                        }
                    } label: {
                        if is_form_complete == true {
                            Text("Add")
                                .foregroundStyle(Color("trailing"))
                                .bold()
                        } else {
                            Text("Add")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_new_exercise_view()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Color("leading"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.colorScheme, .dark)
    }
}
