//
//  Color+Extension.swift
//  WeadyApp
//
//  Created by Alex Lin on 19/10/22.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    /// Returs the equivalent opaque color of a given RGBColor with the required opacity and a white background.
    /// - Parameter opacity: [0 - 1].
    /// - Parameter color: RGBColor that allows to retrieve us each rgb component separatedly
    static func getEquivalentOpaqueColor(opacity: Double, color: RGBColor) -> Color {
        
        if opacity == 1 {
            return Color(red: color.red   / 255,
                         green: color.green / 255,
                         blue: color.blue  / 255,
                         opacity: 1)
        } else {
            let red =   255 + (opacity * (color.red   - 255))
            let green = 255 + (opacity * (color.green - 255))
            let blue =  255 + (opacity * (color.blue  - 255))
            return Color(red: red/255, green: green/255, blue: blue/255, opacity: 1)
        }
    }



}
struct RGBColor {
    let red: Double
    let green: Double
    let blue: Double
}
