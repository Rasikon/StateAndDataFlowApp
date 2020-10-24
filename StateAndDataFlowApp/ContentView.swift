//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.getUser())!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            LogOutButton()
        }
    }
}
struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        CustomButton(action: { timer.startTimer() }, color: .red, title: "\(timer.buttonTitle)")
    }
}

struct LogOutButton: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        CustomButton(action: { user.deleteUser() }, color: .yellow, title: "LogOut")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

