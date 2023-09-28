//
//  ContentView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var active_tab: Tab = .program_page
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Group {
                    switch active_tab {
                    case .account_page:
                        AccountView()
                    case .exercises_page:
                        ExerciseView()
                    case .program_page:
                        ProgramView()
                    case .workout_page:
                        ScrollView {
                            Text("Workout page")
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            HStack {
                Spacer()
                
                Button {
                    active_tab = .program_page
                } label: {
                    Image(systemName: active_tab == .program_page ? "clipboard.fill" : "clipboard")
                }
                
                Spacer()
                
                Button {
                    active_tab = .exercises_page
                } label: {
                    Image(systemName: active_tab == .exercises_page ? "checklist" : "checklist.unchecked")
                }
                
                Spacer()
                
                Button {
                    active_tab = .workout_page
                } label: {
                    Image(systemName: active_tab == .workout_page ? "dumbbell.fill" : "dumbbell")
                }
                
                Spacer()
                
                Button {
                    active_tab = .account_page
                } label: {
                    Image(systemName: active_tab == .account_page ? "person.fill" : "person")
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
