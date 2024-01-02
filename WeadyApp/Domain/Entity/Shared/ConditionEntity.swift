//
//  ConditionEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

struct ConditionEntity {
    let textCondition: String?
    let icon: String?
    let code: Int?
    
    init(decodable: ConditionDecodable?) {
        self.textCondition = decodable?.textCondition
        self.icon = decodable?.icon
        self.code = decodable?.code
    }
}
