//
//  View+Extension.swift
//  WeadyApp
//
//  Created by Alex Lin on 18/3/23.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension View {
    func NeumorphicStyle() -> some View {
        self.padding(30)
            .frame(maxWidth: .infinity)
            .background(Color.offWhite)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

struct NeumorphicCardView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("This is a Neumorphic Card")
                .font(.system(size: 25).bold())
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
        }
        .NeumorphicStyle()
    }
}
