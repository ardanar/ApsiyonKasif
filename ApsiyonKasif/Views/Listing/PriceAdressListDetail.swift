//
//  PriceAdressListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct PriceAdressListDetail: View {
    let listDetail: ListDetail?

    var body: some View {
        VStack {
            Text("\(listDetail?.advertTitle.price ?? 0) ₺")
                .font(.customFont(.bold, fontSize: 32))
                .foregroundColor(.titleBlue)
                .padding(.vertical, 15)
                .maxLeft
                .padding(.horizontal, 20)

            Rectangle()
                .fill(Color.customGray)
                .frame(width: 333, height: 1)
                .padding(.bottom, 15)
                .opacity(0.1)

            Text(listDetail?.advertTitle.title ?? "")
                .font(.customFont(.bold, fontSize: 20))
                .multilineTextAlignment(.leading)
                .foregroundColor(.titleBlue)
                .padding(.vertical, 15)
                .padding(.bottom, 8)

            Text("\(listDetail?.advertTitle.cityName ?? ""), \(listDetail?.advertTitle.countyName ?? "")")
                .font(.customFont(.semiBold, fontSize: 16))
                .foregroundColor(Color.customGray)
                .maxLeft
                .padding(.horizontal, 15)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}
