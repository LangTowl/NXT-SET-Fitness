//
//  ProgramInspectorView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI
import SwiftData

struct ProgramInspectorView: View {
    
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_program_inspector
    
    @Bindable var program: Program
    var ordered_days: [ProgramDay] {
        program.program_days.sorted(by: { $0.order < $1.order })
    }
    
    var focused_day: ProgramDay {
        return ordered_days[focus]
    }
    
//    var ordered_exercises: [AddedExercise] {
//        ordered_days[focus].exercises.sorted(by: { $0.order < $1.order })
//    }
    
    @State private var focus: Int = 0
    @State private var show_popover: Bool = false
    @State private var name: String = ""
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(0...(ordered_days.count - 1), id: \.self) { i in
                    Button {
                        focus = i
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: program_day_button_radius)
                                .foregroundStyle(ordered_days[i].is_off_day == true ?  Color("trailing") : Color("leading"))
                                .opacity(focus == i ? 1.0 : 0.5)
                            
                            switch program.type {
                            case ProgramType.daily.rawValue:
                                Text(String(i + 1))
                                    .foregroundStyle(.white)
                                    .bold()
                            case ProgramType.weekly.rawValue:
                                Text(weeklky_program_ids[i])
                                    .foregroundStyle(.white)
                                    .bold()
                            default:
                                EmptyView()
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                if program.type == ProgramType.daily.rawValue {
                    Button {
                        program.program_days.append(ProgramDay(name: "Day \(program.program_days.count + 1)", order: program.program_days.count))
                        try? model_context.save()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: program_day_button_radius)
                                .foregroundStyle(Color("leading"))
                                .opacity(0.5)
                            
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                                .font(.title3).bold()
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        
        HStack {
            Text(ordered_days[focus].name)
                .font(.title).bold()
            
            VStack {
                Spacer()
                
                Text(program.type == ProgramType.daily.rawValue ? "Day \(focus + 1)" : weekly_program_names[focus])
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.5))
            }
            
            Spacer()
            
            Button {
                show_popover.toggle()
            } label: {
                Text("Edit")
                    .foregroundStyle(Color("leading"))
                    .bold()
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal)
            
            if ordered_days[focus].is_off_day != true {
                NavigationLink(destination: ProgramExerciseAdderView(program_day: ordered_days[focus], passed_context: model_context)) {
                    Text("Add")
                        .foregroundStyle(Color("trailing"))
                        .bold()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
        .frame(height: 25)
        
        NavigationStack {
            Group {
                if ordered_days[focus].is_off_day == true {
                    VStack {
                        Spacer()
                        
                        Text("Off Day")
                            .font(.title)
                            .bold()
                        
                        Text("No workouts scheduled")
                            .font(.footnote)
                            .opacity(0.5)
                        
                        Spacer()
                    }
                } else {
                    if ordered_days[focus].exercises.count == 0 {
                        VStack {
                            Spacer()
                            
                            Text("No exercises added")
                                .font(.title)
                                .bold()
                            
                            Spacer()
                        }
                    } else {
                        List {
                            ForEach(focused_day.exercises, id: \.self) { exercise in
                                NavigationLink(destination: AddedExerciseInspectorView(exercise: exercise)) {
                                    VStack {
                                        HStack {
                                            Text(exercise.name)
                                                .bold()
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("sets:")
                                                .opacity(0.5)
                                            Text(String(exercise.sets))
                                            
                                            Spacer()
                                            
                                            Text("reps:")
                                                .opacity(0.5)
                                            Text(String(exercise.reps))
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .navigationTitle(program.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button {
//                        dismiss_program_inspector()
//                        model_context.delete(program)
//                    } label: {
//                        Text("Delete")
//                            .foregroundStyle(Color("leading"))
//                            .bold()
//                    }
//                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_program_inspector()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                }
            }
            .sheet(isPresented: $show_popover) {
                NavigationStack {
                    Form {
                        Section(footer: Text("Choose a new name for this program day.")) {
                            TextField("New name", text: $name)
                        }
                        
                        Section(footer: Text("Off days have no scheduled workout sessions.")) {
                            Button {
                                ordered_days[focus].is_off_day.toggle()
                                try? model_context.save()
                                show_popover.toggle()
                            } label: {
                                Text("Make this day an off day")
                                    .foregroundStyle(Color("trailing"))
                                    .bold()
                            }
                        }
                    }
                    .navigationTitle("Edit \(ordered_days[focus].name)")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                if name != "" {
                                    ordered_days[focus].name = name
                                    try? model_context.save()
                                    name = ""
                                    show_popover.toggle()
                                }
                            } label: {
                                if name != "" {
                                    Text("Save")
                                        .foregroundStyle(Color("trailing"))
                                        .bold()
                                } else {
                                    Text("Save")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                            }
                        }
                        
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                show_popover.toggle()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(Color("leading"))
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
                .presentationBackground(.ultraThinMaterial)
                .environment(\.colorScheme, .dark)
            }
        }
//        .padding(.horizontal)
    }
}
