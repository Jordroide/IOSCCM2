//
//  Domains.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 22/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//
import Foundation

class MyData: Codable {
    let total, time: Int?
    let domains: [Domain]?
}

class Domain: Codable {
    let domain: String?
    let suffix: String?
    let expiryDate: String?
    let createDate: String?
    let updateDate: String?
    let isDead: Bool?
    let a, txt: [String]?
    let country: String?
    let ns: [String]?
    let resolvable: Bool?
    let cname: String?
    let mx: [MX]?
    
    enum CodingKeys: String, CodingKey {
        case domain, suffix
        case expiryDate = "expiry_date"
        case createDate = "create_date"
        case updateDate = "update_date"
        case isDead
        case a = "A"
        case txt = "TXT"
        case country
        case ns = "NS"
        case resolvable
        case cname = "CNAME"
        case mx = "MX"
    }
}

class MX: Codable {
    let exchange: String?
    let priority: Int?

}
