//
//  ProgramInspectorView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import SwiftUI

struct ProgramInspectorView: View {
    
    // Passed variable
    @Bindable var program: Program
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(String(program.program_days.count))
            }
            .navigationTitle(program.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProgramSettingsView(program: program)) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

//#Preview {
//    ProgramInspectorView()
//}
