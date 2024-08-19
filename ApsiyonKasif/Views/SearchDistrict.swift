//
//  SearchDistrict.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 23.07.2024.
//

import SwiftUI

struct SearchDistrict: View {
    var selectedCityName: String?
    var selectedCityID: Int?
    
    @State private var selectedDistrict: District? = nil
    @State private var navigateToNeighborhood = false
    
    @StateObject private var viewModel = DistrictViewModel()
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            
            SearchHeader(value: 0.6, text: "Pekala, arama yapmak istediğin\nlokasyon nedir?")
                .padding(.bottom, 100)
            
            VStack {
                Spacer()
                
                Text("İlçe Seçimi")
                    .font(.customFont(.extraBold, fontSize: 32))
                    .padding(.top, 120)
                    .foregroundColor(.titleBlue)
                
                VStack {
                    Text(selectedCityName ?? "")
                        .font(.customFont(.extraBold, fontSize: 16))
                        .foregroundColor(.bgBlue)
                        .maxLeft
                        .padding(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.btnBlue, lineWidth: 5)
                        )
                        .cornerRadius(10)
                        .background(
                            Color.bgBlue
                                .opacity(0.1)
                                .cornerRadius(10)
                        )
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 30)
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding(.top, 20)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding(.top, 20)
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.districts) { district in
                                Button(action: {
                                    selectedDistrict = district
                                    
                                    UserDefaults.standard.set(district.id, forKey: "districtId")
                                    navigateToNeighborhood = true
                                }) {
                                    Text(district.name)
                                        .font(.customFont(.extraBold, fontSize: 16))
                                        .maxLeft
                                        .padding(20)
                                        .background(selectedDistrict?.id == district.id ? Color.bgBlue : Color.customWhite)
                                        .foregroundColor(selectedDistrict?.id == district.id ? .customWhite : .titleBlue)
                                        .cornerRadius(10)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                }
                
                Spacer()
                
                NavigationLink(
                    destination: NeighbourhoodView(selectedCity: selectedCityName, selectedDistrict: selectedDistrict?.name, selectedDistrictID: selectedDistrict?.id),
                    isActive: $navigateToNeighborhood
                ) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            if let cityID = selectedCityID {
                viewModel.fetchDistricts(forCityID: cityID)
            }
        }
    }
}

#Preview {
    SearchDistrict(selectedCityName: "İstanbul", selectedCityID: 1) 
}
