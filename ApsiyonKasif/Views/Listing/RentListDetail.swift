//
//  RentListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct RentListDetail: View {
    let listDetail: ListDetail
    @StateObject private var viewModel = ListDetailViewModel()
    
    var body: some View {
        VStack {
            Text("Kira Geçmişi")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            ForEach(listDetail.history.tenants, id: \.startDate) { tenant in
                RentRow(tenant: tenant)
                    .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}

struct RentRow: View {
    let tenant: Tenant
    
    var body: some View {
        HStack {
            VStack {
                Text(tenant.startDate)
                    .font(.customFont(.semiBold, fontSize: 14))
                    .foregroundColor(.customGray)
                    .padding(.bottom, 3)
                    .maxLeft
                
                Text("İlan Kiralandı")
                    .font(.customFont(.bold, fontSize: 16))
                    .foregroundColor(.titleBlue)
                    .maxLeft
            }
            
            Spacer()
            
            VStack {
                if tenant.duration == 0 {
                    Text("halen")
                        .font(.customFont(.semiBold, fontSize: 14))
                        .foregroundColor(.customGray)
                        .padding(.bottom, 3)
                        .maxRight
                } else {
                    Text("\(tenant.duration) ay")
                        .font(.customFont(.semiBold, fontSize: 14))
                        .foregroundColor(.customGray)
                        .padding(.bottom, 3)
                        .maxRight
                }
                
                Text("\(tenant.price) ₺")
                    .font(.customFont(.bold, fontSize: 18))
                    .foregroundColor(.titleBlue)
                    .maxRight
            }
        }
    }
}
