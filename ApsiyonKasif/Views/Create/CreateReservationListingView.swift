//
//  ReservationListingView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//


import SwiftUI

struct CreateReservationListingView: View {
    let reservation: CreateReservation
    
    var body: some View {
        VStack {
            HStack {
                Image(reservation.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 125)
                    .cornerRadius(10, corner: .topLeft)
                    .padding(.trailing, 15)
                VStack(alignment: .leading) {
                    Text(reservation.title)
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.trailing, 30)
                        .maxLeft
                    Text(reservation.location)
                        .font(.customFont(.medium, fontSize: 12))
                        .foregroundColor(.customGray)
                }
                .padding(.vertical, 10)
            }
            HStack {
                Image("room")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .padding(.trailing, 4)
                Text(reservation.rooms)
                    .font(.customFont(.bold, fontSize: 12))
                    .foregroundColor(.titleBlue)
                    .padding(.trailing, 30)
                
                Image("area")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .padding(.trailing, 4)
                Text(reservation.area)
                    .font(.customFont(.bold, fontSize: 12))
                    .foregroundColor(.titleBlue)
                
                Spacer()
                
            }
            .padding(10)
        }
        .background(Color.customWhite)
        .cornerRadius(10)
    }
}


