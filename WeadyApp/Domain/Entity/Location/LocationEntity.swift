//
//  LocationEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct LocationEntity {
    let name: String?
    let region: String?
    let country: String?
    let lat: Float?
    let lon: Float?
    let timeZoneId: String?
    let localtimeEpoch: Int?
    let localtime: String?
    
    init(decodable: LocationDecodable?) {
        self.name = decodable?.name
        self.region = decodable?.region
        self.country = decodable?.country
        self.lat = decodable?.latitude
        self.lon = decodable?.longitude
        self.timeZoneId = decodable?.timeZoneId
        self.localtimeEpoch = decodable?.localtimeEpoch
        self.localtime = decodable?.localtime
    }
}
