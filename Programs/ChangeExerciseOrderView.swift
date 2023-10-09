//
//  ChangeExerciseOrderView.swift
//  NXT SET
//
//  Created by Lang Towl on 10/9/23.
//

import SwiftUI

struct ChangeExerciseOrderView: View {
    
    // Environmental Variables
    @Environment(\.dismiss) var dissmiss_change_order_view
    
    // Passed variables
    @Bindable var day: ProgramDay
    @State var buffer: [ExerciseOrderBuffer]
    
    var body: some View {
        NavigationStack {
            List($buffer, id: \.self, editActions: .move) { $buffer in
                Text(buffer.name)
            }
            .navigationTitle(day.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dissmiss_change_order_view()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dissmiss_change_order_view()
                    } label: {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}
