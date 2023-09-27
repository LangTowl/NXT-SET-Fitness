//
//  NewAccountView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI
import SwiftData

struct NewAccountView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    
    // Enviromental variables
    @Environment(\.dismiss) var dismiss_new_user_view
    
    // Varaibles for new user creation
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password_verify: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Enter your desired name.")) {
                    TextField("Name", text: $name)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Enter your email. (Used for account recovery only)")) {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Create a password.)")) {
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Re-enter your password.")) {
                    SecureField("Password verify", text: $password_verify)
                        .autocapitalization(.none)
                }
            }
            .navigationTitle("New User")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if name != "" && email != "" {
                            if password != "" && password_verify != "" {
                                if password == password_verify {
                                    
                                    let new_user = User(name: name, email: email, password: password)
                                    model_context.insert(new_user)
                                    dismiss_new_user_view()
                                } else {
                                    
                                    print("passwords dont match")
                                }
                            } else {
                                
                                print("must have passwords that match")
                            }
                        } else {
                            
                            print("must have valid name and email.")
                        }
                    } label: {
                        Text("Finish")
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
