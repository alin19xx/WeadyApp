//
//  Grid.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation
import SwiftUI

enum Grid: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    
    // The value of margin left + margin right (16 + 16)
    static let margins: CGFloat = 48
    // Spacing between grid columns
    static let gutter: CGFloat = 20
    // Width from screen
    static let screenWidth: CGFloat = CGFloat(UIScreen.main.bounds.size.width)
    // This value is the minWidth a button can have. It's only needed in one column case
    static let minWidth: CGFloat = MainUtils.isSmallDevice ?  80 : 120
    
    var gridWidth: CGFloat {
        switch self {
        case .one:
            return columnWidth
        case .two:
            return (columnWidth * 2) + (Grid.gutter)
        case .three:
            return (columnWidth * 3) + (Grid.gutter * 2)
        case .four:
            return (columnWidth * 4) + (Grid.gutter * 3)
        }
    }
    
    var columnWidth: CGFloat {
        return (((Grid.screenWidth) - (Grid.margins + (Grid.gutter * 3))) / (MainUtils.iPadDevice ? 12 : 4))
    }
}
