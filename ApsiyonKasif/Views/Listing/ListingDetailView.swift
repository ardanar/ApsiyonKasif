//
//  ListingDetailView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

import SwiftUI

struct ListingDetailView: View {
    let listing: Listing

    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var advertType: String = UserDefaults.standard.string(forKey: "advertType") ?? "Satılık"

    @StateObject private var viewModel = ListDetailViewModel()
    @StateObject private var reservationViewModel = ReservationListDetailViewModel()
    
    @State private var showSuccessReservation = false
    @State private var navigateToGuide = false

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
                        .cornerRadius(30, corner: [.topLeft, .topRight])
                        .padding(.bottom, -50)
                }

                VStack {
                    VStack {
                        HStack {
                            NavigationLink(destination: ListView()) {
                                Image(systemName: "chevron.left.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
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
                        .padding(.top, -50)
                    }
                    
                    ScrollView {
                        VStack {
                            if let images = viewModel.listDetail?.images, !images.isEmpty {
                                ZStack(alignment: .topTrailing) {
                                    AsyncImage(url: URL(string: images[0])) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 333, height: 240)
                                    .cornerRadius(8)
                                    .padding(.bottom, 10)
                                }
                            } else {
                                Text("No Images Available")
                                    .foregroundColor(.gray)
                                    .frame(width: 333, height: 240)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .padding(.bottom, 10)
                            }

                            HStack {
                                if let images = viewModel.listDetail?.images, images.count > 1 {
                                    AsyncImage(url: URL(string: images[1])) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 161.5, height: 108)
                                    .cornerRadius(8)
                                }

                                Spacer()

                                if let images = viewModel.listDetail?.images, images.count > 1 {
                                    AsyncImage(url: URL(string: images[1])) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 161.5, height: 108)
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 30)


                        // Fiyat & Adres
                        if let listDetail = viewModel.listDetail {
                            PriceAdressListDetail(listDetail: listDetail)

                            // İlan Bilgileri
                            AdvertListDetail(listDetail: listDetail)
                            
                            // Harita Bilgileri
                            LocationDetailView(listDetail: listDetail)

                            // Fatura Bilgileri
                            BillingListDetail(listDetail: listDetail)

                            // Kira Geçmişi
                            RentListDetail(listDetail: listDetail)

                            // Site Hizmetleri
                            SiteListDetail(listDetail: listDetail)

                            // İlan Sahibi
                            OwnerListDetail(listDetail: listDetail)

                            // Tur Rezervasyonu
                            ReservationListDetail(listDetail: listDetail)
                        } else {
                            Text("Loading details...")
                                .foregroundColor(.gray)
                        }
                    }

                    VStack {
                        Button(action: {
                            // Rezervasyon işlemleri
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            let selectedDateString = dateFormatter.string(from: selectedDate)

                            let timeFormatter = DateFormatter()
                            timeFormatter.dateFormat = "HH:mm"
                            let selectedTimeString = timeFormatter.string(from: selectedTime)

                            reservationViewModel.makeReservation(date: selectedDateString, time: selectedTimeString) { result in
                                switch result {
                                case .success:
                                    print("Rezervasyon başarıyla yapıldı")
                                    showSuccessReservation = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        navigateToGuide = true
                                    }
                                case .failure(let error):
                                    print("Rezervasyon yapılamadı: \(error.localizedDescription)")
                                }
                            }
                        }, label: {
                            Text("Rezervasyon Yap")
                                .foregroundColor(.customWhite)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                        })
                        .frame(width: 327, height: 48)
                        .background(Color.btnBlue)
                        .cornerRadius(10)
                    }
                    .padding(.top, 50)
                    .padding(.bottom, -50)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 60)
            }
            .onAppear {
                if let advertId = UserDefaults.standard.string(forKey: "advertId") {
                    viewModel.fetchListDetail(for: advertId)
                    print("Fetched advertId: \(advertId)")
                }
            }
            .background(
                NavigationLink(destination: GuideView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode(.inline),
                               isActive: $navigateToGuide) { EmptyView() }
            )
            .background(
                NavigationLink(destination: SuccessReservationListingView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode(.inline),
                               isActive: $showSuccessReservation) { EmptyView() }
            )
            
        }
    }
}
