//
//  ReservationListingDetailView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI

struct CreateReservationListingDetailView: View {
    let reservation: CreateReservation
    let homeId: Int
    let advertTypeId: Int
    
    @State private var ilanFiyati: String = ""
    @State private var ilanTuru: String = "Satılık"
    @StateObject private var viewModel = CreateAdvertViewModel()
    
    @State var success: Bool = false
    
    @State var showSuccessCreation: Bool = false
    @State var navigateToGuide: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(.bgBlue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 130)
                        .cornerRadius(50, corner: [.topLeft, .topRight])
                        .padding(.bottom, -50)
                }
                
                VStack {
                    VStack {
                        HStack {
                            NavigationLink(destination: CreateGuideView()) {
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
                        
                        SearchHeader(value: 1, text: "Şimdi de dairenize ait yayınlama bilgilerini doldurmalısınız.")
                        
                        VStack {
                            HStack {
                                Rectangle()
                                    .fill(.gray)
                                    .frame(width: 104.5, height: 1)
                                Spacer()
                                
                                Text("Seçili Daire")
                                    .font(.customFont(.medium, fontSize: 14))
                                    .foregroundColor(.customGray)
                                
                                Spacer()
                                
                                Rectangle()
                                    .fill(.gray)
                                    .frame(width: 104.5, height: 1)
                            }
                            .padding(.top, 30)
                            
                            VStack {
                                HStack {
                                    Image(reservation.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 125)
                                        .cornerRadius(10, corner: [.topLeft])
                                        .padding(.trailing, 15)
                                    VStack(alignment: .leading) {
                                        Text(reservation.title)
                                            .font(.customFont(.bold, fontSize: 14))
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
                                HStack {
                                    Image("room")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                        .padding(.trailing, 4)
                                    Text(reservation.rooms)
                                        .font(.customFont(.bold, fontSize: 12))
                                        .foregroundColor(.titleBlue)
                                    Spacer()
                                    Image("area")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    Text(reservation.area)
                                        .font(.customFont(.bold, fontSize: 12))
                                        .foregroundColor(.titleBlue)
                                    Spacer()
                                }
                                .padding(10)
                            }
                            .background(Color.customWhite)
                            .cornerRadius(10)
                            
                            HStack {
                                Rectangle()
                                    .fill(.gray)
                                    .frame(width: 97, height: 1)
                                Spacer()
                                
                                Text("Yayınlama Bilgileri")
                                    .font(.customFont(.medium, fontSize: 14))
                                    .foregroundColor(.customGray)
                                
                                Spacer()
                                
                                Rectangle()
                                    .fill(.gray)
                                    .frame(width: 97, height: 1)
                            }
                            .padding(.vertical, 30)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("İlan Fiyatı")
                                        .font(.customFont(.bold, fontSize: 14))
                                        .foregroundColor(.titleBlue)
                                    
                                    Spacer()
                                    
                                    TextField("İlan Fiyatı", text: $ilanFiyati)
                                        .multilineTextAlignment(.trailing)
                                        .padding(.trailing)
                                        .frame(width: 150)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                                
                                HStack {
                                    Text("İlan Türü")
                                        .font(.customFont(.bold, fontSize: 14))
                                        .foregroundColor(.titleBlue)
                                    
                                    Spacer()
                                    
                                    Picker(selection: $ilanTuru, label: Text("İlan Türü Seçiniz")) {
                                        Text("Satılık").tag("Satılık")
                                        Text("Kiralık").tag("Kiralık")
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                    .frame(width: 150)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .background(Color.bg.ignoresSafeArea())
                        .padding(.top, -170)
                    }
                    
                    VStack {
                        Button(action: {
                            print("Current ilanTuru: \(ilanTuru)")
                            guard let advertTypeId = getAdvertTypeId() else {
                                print("Invalid advert type")
                                return
                            }
                            
                            viewModel.createAdvert(price: Decimal(string: ilanFiyati) ?? 0, advertTypeId: advertTypeId, homeId: homeId)
                            showSuccessCreation = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                navigateToGuide = true
                            }
                        }, label: {
                            Text("İlanı Yayınla")
                                .foregroundColor(.customWhite)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                        })
                        .frame(width: 327, height: 48)
                        .background(Color.btnBlue)
                        .cornerRadius(10)
                    }
                    .padding(.top, 50)
                    
                    NavigationLink(destination: SuccessCreation()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitleDisplayMode(.inline),
                        isActive: $showSuccessCreation) { EmptyView() }
                    
                }
            }
        }
    }
    
    private func getAdvertTypeId() -> Int? {
        switch ilanTuru {
        case "Satılık":
            return 1
        case "Kiralık":
            return 2
        default:
            return nil
        }
    }
}
