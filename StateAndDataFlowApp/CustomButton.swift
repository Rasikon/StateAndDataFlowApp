//
//  CustomButton.swift
//  StateAndDataFlowApp
//
//  Created by Rasikon on 24.10.2020.
//

import SwiftUI

struct CustomButton: View {
    let action: () -> Void
    let color: Color
    let title: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: { print(1) }, color: .yellow, title: "1234")
    }
}
