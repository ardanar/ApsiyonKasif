//
//  SuccessReservation.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

import SwiftUI

struct SuccessCreation: View {
    @State private var navigateToGuide = false
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            
            VStack{
                
                Image("success")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 135)
                    .padding(.bottom, 30)
                
                Text("İlanınız Oluşturuldu!")
                    .font(.customFont(.bold, fontSize: 24))
                    .foregroundColor(.customWhite)
                    .padding(.bottom, 10)
                Text("Ana sayfaya yönlendiriliyorsunuz.")
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(.customWhite)
                    .padding(.bottom, 30)
                
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
    SuccessCreation()
}
