//
//  Activity.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import Foundation

struct Activity: Codable {
    let type: String
}

struct ActivityModel: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    
    var priceRate: String {
        switch price {
        case let myPrice where myPrice == 0.00:
            return "Free"
        case let myPrice where myPrice <= 0.30:
            return "Low"
        case let myPrice where myPrice <= 0.60:
            return "Medium"
        default:
            return "High"
        }
    }
}
