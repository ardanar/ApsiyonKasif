//
//  BillingListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct BillingListDetail: View {
    let listDetail: ListDetail?
    @StateObject private var viewModel = ListDetailViewModel()

    var body: some View {
        VStack {
            Text("Fatura Bilgileri")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            if let invoices = listDetail?.billing.invoices {
                ForEach(invoices, id: \.self) { invoice in
                    InvoiceRow(invoice: invoice)
                        .padding(.horizontal, 20)
                    
                    Rectangle()
                        .fill(Color.customGray)
                        .frame(width: 333, height: 1)
                        .padding(.bottom, 15)
                        .opacity(0.1)
                }
            }
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}

struct InvoiceRow: View {
    let invoice: Invoice
    
    var body: some View {
        HStack {
            Image(invoiceIconName(for: invoice.invoiceTypeName))
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.trailing, 10)
            
            Text(invoice.invoiceTypeName)
                .font(.customFont(.semiBold, fontSize: 14))
                .foregroundColor(.customGray)
            
            Spacer()
            
            Text("~\(invoice.amount) ₺")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
            Text("/ay")
                .font(.customFont(.semiBold, fontSize: 10))
                .foregroundColor(.customGray)
        }
    }
    
    private func invoiceIconName(for type: String) -> String {
        switch type {
        case "Elektrik":
            return "electric"
        case "Su":
            return "water"
        case "Doğalgaz":
            return "naturalGas"
        case "İnternet":
            return "wifi"
        default:
            return ""
        }
    }
}
