//
//  GuideView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 21.07.2024.
//

import SwiftUI

struct GuideView: View {
    
    @State var name: String = "Arda"
    @State private var showSearchHelp: Bool = false
    @State private var showCreateHelp: Bool = false
    @State private var delayedSearchHelpText: Bool = false
    @State private var delayedCreateHelpText: Bool = false
    @State private var delayedReservationHelpText: Bool = false
    @State private var showSearch: Bool = false
    @State private var navigateToSearch: Bool = false
    @State private var navigateToCreateGuide: Bool = false
    @State private var navigateToReservations: Bool = false
    @State private var showReservationHelp: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                Rectangle()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .foregroundColor(.bgBlue)
                    .cornerRadius(50, corner: [.topLeft, .topRight])
                    .padding(.bottom, -20)
            }
            
            VStack {
                Spacer()
                VStack {
                    Image("iconPrimary")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 60)
                    Spacer()
                    Text("Apsiyon Kaşif platformuna hoş \n geldin \(name)!")
                        .font(.customFont(.semiBold, fontSize: 16))
                        .maxLeft
                        .padding(.leading, 15)
                        .foregroundColor(.customWhite)
                        .frame(width: 303, height: 68)
                        .background(Color.bgBlue)
                        .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
                        .padding(.horizontal, 30)
                    
                    Text("Sana nasıl yardımcı olabilirim?")
                        .font(.customFont(.semiBold, fontSize: 16))
                        .maxLeft
                        .padding(.leading, 15)
                        .foregroundColor(.customWhite)
                        .frame(width: 257, height: 44)
                        .background(Color.bgBlue)
                        .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 15)
                    
                    
                    if showSearchHelp {
                        VStack {
                            Text("İlan aramak istiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .maxRight
                                .padding(.trailing, 15)
                                .foregroundColor(.titleBlue)
                                .frame(width: 198, height: 44)
                                .background(Color.customWhite)
                                .cornerRadius(10, corner: [.bottomLeft, .topLeft, .topRight])
                                .maxRight
                                .padding(.bottom, 15)
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if delayedSearchHelpText {
                                Text("Elbette, seni ilan arama adımına yönlendiriyorum.")
                                    .font(.customFont(.medium, fontSize: 16))
                                    .maxLeft
                                    .padding(.leading, 15)
                                    .foregroundColor(.customWhite)
                                    .frame(width: 303, height: 68)
                                    .background(Color.bgBlue)
                                    .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                                    .padding(.horizontal, 30)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            navigateToSearch = true
                                        }
                                    }
                            }
                        }
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                delayedSearchHelpText = true
                            }
                        }
                    }
                    
                    
                    if showCreateHelp {
                        VStack {
                            Text("İlan oluşturmak istiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .maxRight
                                .padding(.trailing, 15)
                                .foregroundColor(.titleBlue)
                                .frame(width: 227, height: 44)
                                .background(Color.customWhite)
                                .cornerRadius(10, corner: [.bottomLeft, .topLeft, .topRight])
                                .maxRight
                                .padding(.bottom, 15)
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if delayedCreateHelpText {
                                Text("Elbette, seni ilan oluşturma adımına yönlendiriyorum.")
                                    .font(.customFont(.medium, fontSize: 16))
                                    .maxLeft
                                    .padding(.leading, 15)
                                    .foregroundColor(.customWhite)
                                    .frame(width: 303, height: 68)
                                    .background(Color.bgBlue)
                                    .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                                    .padding(.horizontal, 30)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            navigateToCreateGuide = true
                                        }
                                    }
                            }
                        }
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                delayedCreateHelpText = true
                            }
                        }
                    }
                    
                    
                    if showReservationHelp {
                        VStack {
                            Text("Rezervasyonlarımı görmek\nistiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .maxLeft
                                .padding(.leading, 15)
                                .foregroundColor(.titleBlue)
                                .frame(width: 303, height: 68)
                                .background(Color.customWhite)
                                .cornerRadius(10, corner: [.bottomLeft, .topLeft, .topRight])
                                .maxRight
                                .padding(.bottom, 15)
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if delayedReservationHelpText {
                                Text("Elbette, seni rezervasyonlar sayfasına yönlendiriyorum.")
                                    .font(.customFont(.medium, fontSize: 16))
                                    .maxLeft
                                    .padding(.leading, 15)
                                    .foregroundColor(.customWhite)
                                    .frame(width: 303, height: 68)
                                    .background(Color.bgBlue)
                                    .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                                    .padding(.horizontal, 30)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            navigateToReservations = true
                                        }
                                    }
                            }
                        }
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                delayedReservationHelpText = true
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        withAnimation {
                            showCreateHelp.toggle()
                            delayedCreateHelpText = false
                            if showSearchHelp {
                                showSearchHelp = false
                                delayedSearchHelpText = false
                            }
                            if showReservationHelp {
                                showReservationHelp = false
                                delayedReservationHelpText = false 
                            }
                        }
                    }) {
                        if showCreateHelp {
                            Text("İlan oluşturmak istiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .foregroundColor(Color.bgBlue)
                                .frame(width: 159, height: 70)
                                .background(Color.customWhite)
                                .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
    
                        } else {
                            Text("İlan oluşturmak istiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .foregroundColor(.customWhite)
                                .frame(width: 159, height: 70)
                                .background(Color.btnBlue)
                                .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showSearchHelp.toggle()
                            delayedSearchHelpText = false
                            if showCreateHelp {
                                showCreateHelp = false
                                delayedCreateHelpText = false
                            }
                            if showReservationHelp {
                                showReservationHelp = false
                                delayedReservationHelpText = false
                            }
                        }
                    }) {
                        if showSearchHelp {
                            Text("İlan aramak istiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .foregroundColor(Color.bgBlue)
                                .frame(width: 159, height: 70)
                                .background(Color.customWhite)
                                .cornerRadius(10, corner: [.bottomLeft, .topLeft, .topRight])
                        } else {
                            Text("İlan aramak istiyorum.")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .foregroundColor(.customWhite)
                                .frame(width: 159, height: 70)
                                .background(Color.btnBlue)
                                .cornerRadius(10, corner: [.bottomLeft, .topLeft, .topRight])
                        }
                    }
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 30)
                
                Button(action: {
                    withAnimation {
                        showReservationHelp.toggle()
                        delayedReservationHelpText = false
                        if showSearchHelp {
                            showSearchHelp = false
                            delayedSearchHelpText = false
                        }
                        if showCreateHelp {
                            showCreateHelp = false
                            delayedCreateHelpText = false
                        }
                    }
                }) {
                    if showReservationHelp {
                        Text("Rezervasyonlarımı görmek istiyorum.")
                            .font(.customFont(.semiBold, fontSize: 16))
                            .foregroundColor(Color.bgBlue)
                            .frame(width: 333, height: 50)
                            .background(Color.customWhite)
                            .cornerRadius(10, corner: [.bottomRight, .bottomLeft])
                    } else {
                        Text("Rezervasyonlarımı görmek istiyorum.")
                            .font(.customFont(.semiBold, fontSize: 16))
                            .foregroundColor(.customWhite)
                            .frame(width: 333, height: 50)
                            .background(Color.btnBlue)
                            .cornerRadius(10, corner: [.bottomRight, .bottomLeft])
                    }
                }
                .padding(.bottom, 30)
                .padding(.horizontal, 30)
            }
        }
        .background(
            NavigationLink(
                destination: AdvertView().navigationBarHidden(true),
                isActive: $navigateToSearch,
                label: { EmptyView() }
            )
        )
        .background(
            NavigationLink(
                destination: CreateGuideView().navigationBarHidden(true),
                isActive: $navigateToCreateGuide,
                label: { EmptyView() }
            )
        )
        .background(
            NavigationLink(
                destination: ReservationListView().navigationBarHidden(true),
                isActive: $navigateToReservations,
                label: { EmptyView() }
            )
        )
        .background(Color.bg)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

#Preview {
    GuideView()
}
