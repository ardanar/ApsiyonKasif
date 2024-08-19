//
//  SearchHeader.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 22.07.2024.
//

import SwiftUI


struct SearchHeader: View {
    
    @State var value: Double
    @State var text: String
    
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
            
            VStack{
                
                ProgressView(value: value)
                    .progressViewStyle(CustomProgressViewStyle(trackColor: .customWhite, progressColor: .bgBlue))
                    .frame(width: 333, height: 13)
                    .padding(.bottom, 20)
                
                HStack{
                    
                    Image("iconPrimary")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                        .padding(.trailing, 10)
                    
                    Text(text)
                        .font(.customFont(.semiBold, fontSize: 14))
                        .padding(.leading, -15)
                        .foregroundColor(.customWhite)
                        .frame(width: 253, height: 62)
                        .background(Color.bgBlue)
                        .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                }
                Spacer()
            }
            Spacer()
        }
        .navHideWithout
        .navigationBarHidden(true)
    }
}

#Preview {
    SearchHeader(value: 0.2, text: "Aramak istediğin ilan türü ile\nbaşlayalım.")
}
