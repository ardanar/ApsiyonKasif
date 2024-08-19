//
//  LocationDetailView.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let listDetail: ListDetail?
    
    var body: some View {
        
        let longitude: Double = (listDetail?.location.longitude as? NSNumber)?.doubleValue ?? 0.0
        let latitude: Double = (listDetail?.location.latitude as? NSNumber)?.doubleValue ?? 0.0

        
        VStack {
            Text("İlan Konumu")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                .frame(height: 300)
                .cornerRadius(10)
                .padding(20)
            
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Konum"
        view.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        view.setRegion(region, animated: true)
    }
}
