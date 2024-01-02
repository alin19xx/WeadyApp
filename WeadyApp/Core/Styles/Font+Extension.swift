//
//  Font+Extension.swift
//  WeadyApp
//
//  Created by Alex Lin on 17/10/22.
//

import SwiftUI

enum FontFamily: String {
    case poppins = "Poppins"
}

enum FontStyle: String {
    case light = "-Light"
    case regular = "-Regular"
    case medium = "-Medium"
    case bold = "-Bold"
    case semiBold = "-SemiBold"
    
}

// MARK: - Fonts
extension Font {
    static func getFont(family: FontFamily, style: FontStyle, size: CGFloat) -> Font {
        return Font.custom(family.rawValue + style.rawValue, size: size)
    }
}
