//
//  WelcomeView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 20.07.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack{
                    Spacer()
                    Circle()
                        .trim(from: 0.5, to: 1)
                        .fill(Color.bgBlue)
                        .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.width * 1.7)
                        .offset(y: UIScreen.main.bounds.width / 0.9)
                    
                }
                
                VStack{
                    Spacer()
                    Ellipse()
                        .fill(Color.btnBlue)
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 16)

                        .offset(y: UIScreen.main.bounds.width / 20)
                        .padding(.top, 420)
                    Spacer()
                }
                
                
                VStack{
                    Image("iconPrimary")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 221.5)
                    
                    VStack{
                        
                        Text("Merhaba!")
                            .font(.customFont(.extraBold, fontSize: 32))
                            .padding(.bottom, 8)
                            .foregroundColor(.titleBlue)
                            .padding(.top, 30)
                        
                        Text("Apsiyon Kâşif platformuna hoş geldin! Ben,")
                            .font(.customFont(.medium, fontSize: 16))
                            .padding(.horizontal, 16)
                            .foregroundColor(.explanationBlue)
                        Text("Apsiyon gayrimenkul dünyasında sizlere")
                            .font(.customFont(.medium, fontSize: 16))
                            .padding(.horizontal, 16)
                            .foregroundColor(.explanationBlue)
                        Text("rehberlik edecek sanal asistanınızım.")
                            .font(.customFont(.medium, fontSize: 16))
                            .padding(.horizontal, 16)
                            .foregroundColor(.explanationBlue)
                        Text("Başlamaya hazır mısın?")
                            .font(.customFont(.medium, fontSize: 16))
                            .padding(.top, 16)
                            .foregroundColor(.explanationBlue)
                    }
                    
                    
                    VStack{
                        Spacer()
                        NavigationLink(destination: LoginView()) {
                            Text("Haydi Başlayalım")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.customWhite)
                        }
                        .frame(width: 327, height: 48)
                        .background(Color.btnBlue)
                        .cornerRadius(8.0)
                        .padding(.bottom, 40)
                        
                    }
                    
                    
                }
            }
            .navHide
            .background(Color.bg)
        }
        .navigationBarBackButtonHidden()
    }
    
}


#Preview {
    WelcomeView()
}
