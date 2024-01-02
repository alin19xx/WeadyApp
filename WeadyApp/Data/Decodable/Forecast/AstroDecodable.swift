//
//  AstroDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation

/*
 "astro": {
    "sunrise": "08:01 AM",
    "sunset": "07:14 PM",
    "moonrise": "09:13 PM",
    "moonset": "11:48 AM",
    "moon_phase": "Waning Gibbous",
    "moon_illumination": "76"
 }
 */

struct AstroDecodable: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moonPhase: String?
    let moonIlumination: String?
    
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIlumination = "moon_illumination"
    }
}
