//
//  SuccessReservationListingView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI

struct SuccessReservationListingView: View {
    @State private var navigateToGuide = false

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                Image("success")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 30)
                
                Text("Randevu Talebiniz\nOluşturuldu!")
                    .font(.customFont(.bold, fontSize: 24))
                    .foregroundColor(.customWhite)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                
                Text("Ana sayfaya yönlendiriliyorsunuz.")
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(.customWhite)
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToGuide = true
                }
            }
            .background(
                NavigationLink(destination: GuideView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode(.inline),
                               isActive: $navigateToGuide) { EmptyView() }
        )
        }
    }
}


#Preview {
    SuccessReservationListingView()
}
