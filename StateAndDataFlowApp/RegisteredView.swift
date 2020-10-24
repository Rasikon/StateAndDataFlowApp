//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack(spacing: -50) {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Group {
                    if name.count < 4 {
                        Counter(name: $name, color: .red)
                    } else {
                        Counter(name: $name, color: .green)
                    }
                }
            }
            Button(action: { user.saveUser (name: name) }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(name.count < 4)
        }
    }
}

struct Counter: View {
    @Binding var name: String
    let color: Color
    
    var body: some View {
        Text("\(name.count)")
            .padding(.trailing, 50)
            .foregroundColor(color)
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
