//
//  ForecastModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 11/10/22.
//

import Foundation

struct ForecastModel: Identifiable, Hashable {
    var id = UUID()
    let time: String
    let icon: String
    let maxTempCelcius: Double
    let maxtempFarenheit: Double
}
