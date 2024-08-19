//
//  ReservationListingView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI

struct ReservationListingView: View {
    let reservation: Reservation
    
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: reservation.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 125)
                    .cornerRadius(10, corner: .topLeft)
                    .maxLeft
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading){
                        Text("\(reservation.price) ₺")
                            .font(.customFont(.extraBold, fontSize: 16))
                            .foregroundColor(.bgBlue)
                        Text(reservation.title)
                            .font(.customFont(.bold, fontSize: 14))
                            .foregroundColor(.titleBlue)
                            .lineLimit(2)
                        Text("\(reservation.cityName), \(reservation.countyName)")
                            .font(.customFont(.medium, fontSize: 12))
                            .foregroundColor(.customGray)
                    }
                    .maxLeft
                    .padding(.leading, -50)
                    .padding(.top, 20)
                }
                //.padding([.horizontal, .top], 15)
                
                VStack {
                    ForEach(reservation.appointmentList, id: \.self) { appointment in
                        VStack {
                            HStack {
                                Text(appointment.date)
                                    .font(.customFont(.semiBold, fontSize: 14))
                                    .foregroundColor(.customGray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 10)
                                
                                Text(appointment.hours)
                                    .font(.customFont(.semiBold, fontSize: 14))
                                    .foregroundColor(.customGray)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.bottom, 10)
                                
                                Text(appointment.fullName)
                                    .font(.customFont(.bold, fontSize: 14))
                                    .foregroundColor(.titleBlue)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 15)
                            
                            if appointment != reservation.appointmentList.last {
                                Rectangle()
                                    .fill(Color.customGray)
                                    .frame(height: 1)
                                    .opacity(0.1)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                            }
                        }
                    }
                }
                .padding(.bottom, 15)
                .background(Color.customWhite)
                .cornerRadius(10)
            }
            .background(Color.customWhite)
            .cornerRadius(10)
            .padding(.horizontal, 15)
        }
        .background(Color.bg.ignoresSafeArea())
    }
}
