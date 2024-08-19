//
//  SearchView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        ZStack {
            Color.bgBlue
                .ignoresSafeArea()
            VStack{
                
                Image("launch")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 135)
                    .padding(20)
                
                Text("Size en uygun\nilanları arıyorum..")
                    .font(.customFont(.bold, fontSize: 24))
                    .foregroundColor(.customWhite)
                    .padding(.bottom, 20)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .customWhite))
                
            }
        }
    }
}

#Preview {
    SearchView()
}
