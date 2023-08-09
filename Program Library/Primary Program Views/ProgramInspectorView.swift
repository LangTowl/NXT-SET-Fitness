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
    
    @State private var focus: Int = 0
    @State private var show_popover: Bool = false
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(0...(program.program_days.count - 1), id: \.self) { i in
                    Button {
                        focus = i
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: program_day_button_radius)
                                .foregroundStyle(Color("leading"))
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
            
            Spacer()
            
            Button {
                show_popover.toggle()
            } label: {
                Text("Edit")
                    .foregroundStyle(Color("leading"))
                    .bold()
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal)
        
        NavigationStack {
            List {
                ForEach(ordered_days, id: \.self) { day in
                    Text(day.name)
                }
                
                Text(String(focus))
            }
            .navigationTitle(program.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_program_inspector()
                        model_context.delete(program)
                    } label: {
                        Text("Delete")
                            .foregroundStyle(Color("leading"))
                            .bold()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_program_inspector()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
