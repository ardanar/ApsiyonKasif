//
//  ErrorView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        ZStack{
            Color.error
                .ignoresSafeArea()
            VStack{
                Image("error")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 30)
                
                Text("Bir Hata Oluştu")
                    .font(.customFont(.bold, fontSize: 24))
                    .foregroundColor(.customWhite)
                    .padding(.bottom, 10)
                
                Text("Lütfen daha sonra tekrar deneyin")
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(.customWhite)
            }
            
        }
    }
}

#Preview {
    ErrorView()
}
