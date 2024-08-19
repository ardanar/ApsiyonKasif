//
//  ApsiyonKasifApp.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 20.07.2024.
//

import SwiftUI

@main
struct ApsiyonKasifApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView()
                    .onAppear {
                        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                    }
            }
            .navigationViewStyle(.stack)
        }
    }
}


