//
//  ReservationView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI

struct ReservationListView: View {
    @StateObject private var viewModel = ReservationListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ZStack{
                        Color.bg
                            .ignoresSafeArea()
                        VStack{
                            
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
                            }
                            .padding(.bottom, 30)
                            
                            ScrollView {
                                VStack(spacing: 20) {
                                    ForEach(viewModel.reservations) { reservation in
                                        ReservationListingView(reservation: reservation)
                                    }
                                }
                                .padding(.horizontal, 15)
                            }
                            
                            HStack{
                                
                                Image("iconPrimary")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 65, height: 65)
                                    .padding(.trailing, 10)
                                
                                Text("Mevcut ilanlarınız üzerinden\nrezervasyonlarınızı listeledim!")
                                    .font(.customFont(.semiBold, fontSize: 14))
                                    .padding(.leading, -15)
                                    .foregroundColor(.customWhite)
                                    .frame(width: 253, height: 62)
                                    .background(Color.bgBlue)
                                    .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                            }
                            
                        }
                        
                    }
                }
            }
            .onAppear {
                viewModel.fetchReservations()
            }
            .navigationBarHidden(true)
        }
        .background(Color.bg.ignoresSafeArea()) 
    }
}

#Preview {
    ReservationListView()
}
