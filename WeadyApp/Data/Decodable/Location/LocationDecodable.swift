//
//  LocationDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

struct LocationDecodable: Codable {
    let name: String?
    let region: String?
    let country: String?
    let latitude: Float?
    let longitude: Float?
    let timeZoneId: String?
    let localtime: String?
    let localtimeEpoch: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case latitude = "lat"
        case longitude = "long"
        case timeZoneId = "tz_id"
        case localtime
        case localtimeEpoch = "localtime_epoch"
    }
}
