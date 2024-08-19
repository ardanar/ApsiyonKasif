//
//  OwnerListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct OwnerListDetail: View {
    let listDetail: ListDetail
    @StateObject private var viewModel = ListDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("İlan Sahibi")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)

            HStack {
                if let imageURL = listDetail.owner.image, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 55, height: 55)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .cornerRadius(10)
                                .padding(.trailing, 15)
                        case .failure:
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .cornerRadius(10)
                                .padding(.trailing, 15)
                        @unknown default:
                            EmptyView()
                                .frame(width: 55, height: 55)
                        }
                    }
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55)
                        .cornerRadius(10)
                        .padding(.trailing, 15)
                }

                VStack(alignment: .leading) {
                    Text(listDetail.owner.name)
                        .font(.customFont(.bold, fontSize: 16))
                        .foregroundColor(.titleBlue)
                        .maxLeft

                    HStack {
                        Image(systemName: "phone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.customGray)

                        Text(listDetail.owner.number)
                            .font(.customFont(.semiBold, fontSize: 14))
                            .foregroundColor(.customGray)
                    }
                    .maxLeft
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}
