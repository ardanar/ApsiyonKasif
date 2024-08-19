//
//  NeighbourhoodView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 23.07.2024.
//

import SwiftUI

struct NeighbourhoodView: View {
    var selectedCity: String?
    var selectedDistrict: String?
    var selectedDistrictID: Int? 
    
    @State private var selectedNeighbourhood: String? = nil
    @State private var navigateToFilters = false
    
    @StateObject private var viewModel = NeighbourhoodViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg
                    .ignoresSafeArea()
                
                SearchHeader(value: 0.8, text: "Pekala, arama yapmak istediğin\nlokasyon nedir?")
                    .padding(.bottom, 100)
                
                VStack {
                    Spacer()
                    
                    Text("Mahalle Seçimi")
                        .font(.customFont(.extraBold, fontSize: 32))
                        .padding(.top, 120)
                        .foregroundColor(.titleBlue)
                    
                    VStack {
                        Text(selectedCity ?? "")
                            .font(.customFont(.extraBold, fontSize: 16))
                            .foregroundColor(.bgBlue)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                            .padding(.bottom, 10)
                        
                        Text(selectedDistrict ?? "")
                            .font(.customFont(.extraBold, fontSize: 16))
                            .foregroundColor(.bgBlue)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                                ForEach(viewModel.neighbourhoods) { neighbourhood in
                                    Button(action: {
                                        selectedNeighbourhood = neighbourhood.name
                                       
                                        UserDefaults.standard.set(neighbourhood.id, forKey: "neighbourhoodId")
                                        navigateToFilters = true
                                    }) {
                                        Text(neighbourhood.name)
                                            .font(.customFont(.extraBold, fontSize: 16))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(20)
                                            .background(selectedNeighbourhood == neighbourhood.name ? Color.bgBlue : Color.customWhite)
                                            .foregroundColor(selectedNeighbourhood == neighbourhood.name ? .customWhite : .titleBlue)
                                            .cornerRadius(10)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                    
                    Spacer()
                }
            }
            .background(
                NavigationLink(
                    destination: FiltersView(),
                    isActive: $navigateToFilters,
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
        .onAppear {
            if let districtID = selectedDistrictID {
                viewModel.fetchNeighbourhoods(forCountyID: districtID)
            }
        }
    }
}

#Preview {
    NeighbourhoodView(selectedCity: "İstanbul", selectedDistrict: "Kadıköy", selectedDistrictID: 1)
}
