//
//  AstroEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct AstroEntity {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moonPhase: String?
    let moonIlumination: String?
    
    init(decodable: AstroDecodable?) {
        self.sunrise = decodable?.sunrise
        self.sunset = decodable?.sunset
        self.moonrise = decodable?.moonrise
        self.moonset = decodable?.moonset
        self.moonPhase = decodable?.moonPhase
        self.moonIlumination = decodable?.moonIlumination
    }
}
