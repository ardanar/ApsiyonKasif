//
//  Reservation.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import Foundation


struct CreateReservation: Identifiable {
    var id = UUID()
    let homeId: Int
    let title: String
    let location: String
    let rooms: String
    let imageName: String
    let area: String
    let advertType: String
}


