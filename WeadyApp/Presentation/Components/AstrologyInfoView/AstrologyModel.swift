//
//  AstrologyModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation

struct AstrologyModel {
    let sun: AstroModel
    let moon: AstroModel
}

struct AstroModel {
    let titleRise: String
    let riseTime: String
    let titleSet: String
    let setTime: String
}
