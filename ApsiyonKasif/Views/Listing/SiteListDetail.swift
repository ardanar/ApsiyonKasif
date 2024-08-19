//
//  SiteListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct SiteListDetail: View {
    let listDetail: ListDetail
    @StateObject private var viewModel = ListDetailViewModel()

    var body: some View {
        VStack {
            Text("Site Hizmetleri")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)

            ForEach(listDetail.services, id: \.name) { service in
                ServiceRow(service: service)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}

struct ServiceRow: View {
    let service: Service

    var body: some View {
        HStack {
            Image("check")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.trailing, 5)
            
            Text(service.name)
                .font(.customFont(.semiBold, fontSize: 14))
                .foregroundColor(.titleBlue)
                .maxLeft
        }
    }
}
