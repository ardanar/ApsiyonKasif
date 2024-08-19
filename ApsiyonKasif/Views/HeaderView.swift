//
//  GuideView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 21.07.2024.
//

import SwiftUI

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
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
                
                Spacer()
            }
        }
        .navHideWithout
        .background(Color.bg)
        .navigationBarHidden(true)
    }
}

#Preview {
    HeaderView()
}
