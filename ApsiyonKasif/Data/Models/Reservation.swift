//
//  Reservation.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import Foundation

struct Reservation: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Decimal
    let cityName, countyName: String
    let imageUrl: String
    let appointmentList: [AppointmentList]
}

struct AppointmentList: Identifiable, Codable, Hashable {
    let id: Int
    let fullName: String
    let hours: String
    let date: String
}
