//
//  ListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import Foundation

struct ListDetail: Codable {
    let advertTitle: AdvertTitle
    let advert: Advert
    let location: Location
    let billing: Billing
    let history: History
    let owner: Owner
    let appointments: [Appointment]
    let services: [Service]
    let tourURL: TourURL
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case advertTitle, advert, location, billing, history, owner, appointments, services
        case tourURL = "tourUrl"
        case images
    }
}

struct AdvertTitle: Codable {
    let title: String
    let price: Decimal
    let cityName: String
    let countyName: String
}

struct Advert: Codable {
    let advertNumber: String
    let advertDate: String
    let netArea: String
    let roomCount: String
    let numberOfFloor: Int
    let buildingAge: Int
    let bathroomCount: Int
    let advertType: String
    let floor: String
    let hasFurnished: Bool
    let heatingType: String
    let isInSite: String
}

struct Location: Codable {
    let latitude: Decimal
    let longitude: Decimal
}

struct Billing: Codable {
    let invoices: [Invoice]
}

struct Invoice: Codable, Hashable {
    let amount: Decimal
    let invoiceTypeName: String
    let icon: String
}

struct History: Codable {
    let tenants: [Tenant]
}

struct Tenant: Codable {
    let price: Decimal
    let startDate: String
    let duration: Int
}

struct Owner: Codable {
    let name: String
    let number: String
    let image: String?
    let isOwner: Bool
}

struct Appointment: Codable {
    let text: String
    let value: String
}

struct Service: Codable {
    let name: String
}

struct TourURL: Codable {
    let url: String
}
