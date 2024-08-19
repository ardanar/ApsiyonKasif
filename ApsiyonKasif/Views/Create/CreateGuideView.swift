//
//  CreateGuideView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

//  CreateGuideView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

import SwiftUI

struct CreateGuideView: View {
    let reservations = [
        CreateReservation(homeId: 1, title: "İzzet Paşa Mahallesi AVM Karşısı Satılık 2+1 Daire", location: "İstanbul, Şişli", rooms: "3+1", imageName: "listing1", area: "105 m²", advertType: "Satılık"),
        CreateReservation(homeId: 2, title: "İzzet Paşa Mahallesi AVM Karşısı Satılık 2+1 Daire", location: "İstanbul, Şişli", rooms: "3+1", imageName: "listing1", area: "105 m²", advertType: "Kiralık"),
        CreateReservation(homeId: 3, title: "İzzet Paşa Mahallesi AVM Karşısı Satılık 2+1 Daire", location: "İstanbul, Şişli", rooms: "3+1", imageName: "listing1", area: "105 m²", advertType: "Satılık"),
        CreateReservation(homeId: 4, title: "İzzet Paşa Mahallesi AVM Karşısı Satılık 2+1 Daire", location: "İstanbul, Şişli", rooms: "3+1", imageName: "listing1", area: "105 m²", advertType: "Satılık")
    ]
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        NavigationLink(destination: GuideView()) {
                            Image(systemName: "chevron.left.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 23)
                                .foregroundColor(.customWhite)
                                .padding(.leading, 15)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image("launch")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21.59, height: 25)
                                .padding(8)
                            
                            Text("Apsiyon Kaşif")
                                .font(.customFont(.extraBold, fontSize: 16))
                                .foregroundColor(.customWhite)
                        }
                        .padding(.trailing, 40)
                        
                        Spacer()
                    }
                    .frame(width: 333, height: 49)
                    .background(Color.bgBlue)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    
                    SearchHeader(value: 0.5, text: "Kiralamak ya da satmak istediğiniz daireyi seçin.")
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(reservations) { reservation in
                                NavigationLink(destination: CreateReservationListingDetailView(reservation: reservation, homeId: reservation.homeId, advertTypeId: reservation.advertType == "Satılık" ? 1 : 2)) {
                                    HStack {
                                        Image(reservation.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 125)
                                            .cornerRadius(10)
                                            .padding(.trailing, 15)
                                        
                                        VStack(alignment: .leading) {
                                            Text(reservation.title)
                                                .font(.customFont(.bold, fontSize: 14))
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(.titleBlue)
                                                .lineLimit(nil)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding(.trailing, 30)
                                            
                                            Text(reservation.location)
                                                .font(.customFont(.medium, fontSize: 12))
                                                .foregroundColor(.customGray)
                                        }
                                        .padding(.vertical, 10)
                                    }
                                    .background(Color.customWhite)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                       
                    }
                    .padding(.top, -180)
                }
            }
        }
    }
}
