//
//  Listing.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

import Foundation

struct Listing: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Decimal
    let cityName, countyName: String
    let imageUrl: String
    let features: Features
}

struct Features: Codable {
    let roomCount, netArea, advertTypeName: String
}
