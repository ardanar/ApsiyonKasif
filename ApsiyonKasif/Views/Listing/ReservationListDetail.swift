//
//  ReservationListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct ReservationListDetail: View {
    let listDetail: ListDetail
    @State private var selectedDate: String = ""
    @State private var selectedTime: String = ""
    @StateObject private var viewModel = ReservationListDetailViewModel()

    var groupedAppointments: [String: [String]] {
        Dictionary(grouping: listDetail.appointments.map { $0.value }, by: { $0.components(separatedBy: " ").first ?? "" })
    }

    var body: some View {
        VStack {
            Text("Tur Rezervasyonu")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)

            VStack {
                
                Picker("Tarih Seçiniz", selection: $selectedDate) {
                    ForEach(Array(groupedAppointments.keys), id: \.self) { date in
                        Text(date)
                            .tag(date)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom, 10)
                .onChange(of: selectedDate) { newDate in
                    viewModel.fetchAvailableTimes(for: newDate)
                    viewModel.saveSelectedDate(newDate)
                }
                .onAppear {
                    selectedDate = viewModel.loadSelectedDate()
                    if !selectedDate.isEmpty {
                        viewModel.fetchAvailableTimes(for: selectedDate)
                    }
                }

                
                if !selectedDate.isEmpty {
                    Picker("Saat Seçiniz", selection: $selectedTime) {
                        ForEach(viewModel.availableTimes, id: \.self) { time in
                            Text(time)
                                .tag(time)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}
