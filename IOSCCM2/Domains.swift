//
//  Domains.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 22/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import Foundation

class Domains: Codable {
    
    let domain: String? = nil
    let suffix: String? = nil
   /* let expiryDate: String? = nil
    let createDate: String? = nil
    let updateDate: String? = nil
    let isDead: String? = nil
    let a: [String]? = nil
    let txt: String? = nil
    let country: String? = nil
    let ns: [String]? = nil
    let resolvable: String? = nil
    let cname: String? = nil
    let mx: [MX]? = nil*/
    
    enum CodingKeys: String, CodingKey {
        case domain
        case suffix
        /*case expiryDate = "expiry_date"
        case createDate = "create_date"
        case updateDate = "update_date"
        case isDead
        case a = "A"
        case txt = "TXT"
        case country
        case ns = "NS"
        case resolvable
        case cname = "CNAME"
        case mx = "MX"*/
    }
}

/**
 * Internal class MX with it's sub classes
 */
class MX: Codable {
    let exchange: String? = nil
    let priority: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case exchange
        case priority
    }
}
