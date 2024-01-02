//
//  ConditionDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

struct ConditionDecodable: Codable {
    let textCondition: String?
    let icon: String?
    let code: Int?
    
    enum CodingKeys: String, CodingKey {
        case textCondition = "text"
        case icon
        case code
    }
}
