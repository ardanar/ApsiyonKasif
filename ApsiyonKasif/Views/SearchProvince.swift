//
//  SearchLocation.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 23.07.2024.
//

import SwiftUI

struct SearchProvince: View {
    @StateObject private var viewModel = CityViewModel()
    @State private var selectedCity: City? = nil
    @State private var navigateToDistrict = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg
                    .ignoresSafeArea()
                
                SearchHeader(value: 0.4, text: "Pekala, arama yapmak istediğin\nlokasyon nedir?")
                    .padding(.bottom, 100)
                
                VStack {
                    Spacer()
                    
                    Text("İl Seçimi")
                        .font(.customFont(.extraBold, fontSize: 32))
                        .padding(.top, 120)
                        .foregroundColor(.titleBlue)
                    
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
                                ForEach(viewModel.cities, id: \.id) { city in
                                    Button(action: {
                                        selectedCity = city
                                        
                                        UserDefaults.standard.set(city.id, forKey: "cityId")
                                        navigateToDistrict = true
                                    }) {
                                        Text(city.name)
                                            .font(.customFont(.extraBold, fontSize: 16))
                                            .maxLeft
                                            .padding(20)
                                            .background(selectedCity?.id == city.id ? Color.bgBlue : Color.customWhite)
                                            .foregroundColor(selectedCity?.id == city.id ? .customWhite : .titleBlue)
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
                        destination: SearchDistrict(selectedCityName: selectedCity?.name, selectedCityID: selectedCity?.id),
                        isActive: $navigateToDistrict
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.fetchCities() 
            }
        }
    }
}

#Preview {
    SearchProvince()
}
