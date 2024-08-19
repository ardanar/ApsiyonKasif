//
//  UIExtension.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 20.07.2024.
//

import SwiftUI
import Combine

enum PlusJakarta: String{
    case bold = "PlusJakartaSans-Bold"
    case extraBold = "PlusJakartaSans-ExtraBold"
    case extraLight = "PlusJakartaSans-ExtraLight"
    case light = "PlusJakartaSans-Light"
    case medium = "PlusJakartaSans-Medium"
    case regular = "PlusJakartaSans-Regular"
    case semiBold = "PlusJakartaSans-SemiBold"
}

extension Font{
    static func customFont(_ font: PlusJakarta, fontSize: CGFloat) -> Font{
        custom(font.rawValue, size: fontSize)
    }
}

extension Color {
    static let titleBlue = Color(red: 0/255, green: 9/255, blue: 41/255)
    static let explanationBlue = Color(red: 0x4F / 255, green: 0x61 / 255, blue: 0x7A / 255)
    static let customWhite = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let btnBlue = Color(red: 0x01 / 255, green: 0x8C / 255, blue: 0xBD / 255)
    static let bgBlue = Color(red: 0x00 / 255, green: 0xA5 / 255, blue: 0xDF / 255)
    static let bg = Color(red: 0xEF / 255, green: 0xF2 / 255, blue: 0xF9 / 255)
    static let customGray = Color(red: 90 / 255, green: 107 / 255, blue: 130 / 255)
    static let error = Color(red: 241/255, green: 22/255, blue: 108/255)
    }

extension View {
    
    func cornerRadius( _ radius: CGFloat, corner: UIRectCorner ) -> some View {
        clipShape( RoundedCorner(radius: radius, corner: corner) )
    }
    
    func bgNavLink(content: some View, isAction: Binding<Bool> ) -> some View {
        return self.background(
            NavigationLink(destination: content, isActive: isAction, label: {
                EmptyView()
            })
        )
    }
    
    var navHide: some View {
        return navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
    
    var navHideWithout: some View {
        return navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
    }
    
    var maxCenter: some View {
        return frame(maxWidth: .infinity, alignment: .center)
    }
    
    var maxLeft: some View {
        return frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var maxRight: some View {
        return frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    var top8: some View {
        return padding(.top, 8)
    }
    
    var bottom8: some View {
        return padding(.bottom, 8)
    }
    
    var top16: some View {
        return padding(.top, 16)
    }
    
    var bottom16: some View {
        return padding(.bottom, 16)
    }
    
    var vertical8: some View {
        return padding(.vertical, 8)
    }
    
    var horizontal8: some View {
        return padding(.horizontal, 8)
    }
    
    var vertical16: some View {
        return padding(.vertical, 16)
    }
    
    var horizontal16: some View {
        return padding(.horizontal, 16)
    }
    
    var horizontal32: some View {
        return padding(.horizontal, 32)
    }
    
    var horizontal30: some View {
        return padding(.horizontal, 30)
    }
    
    var all16: some View {
        return padding( 16)
    }
    
    var all32: some View {
        return padding( 32)
    }
    
    var guide30: some View {
        return padding([.horizontal, .bottom], 30)

    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corner: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    var trackColor: Color
    var progressColor: Color

    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .fill(trackColor)
                .frame(height: 13)
                

            RoundedRectangle(cornerRadius: 6)
                .fill(progressColor)
                .padding(.all, 3)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 333, height: 13)
        }
    }
}

