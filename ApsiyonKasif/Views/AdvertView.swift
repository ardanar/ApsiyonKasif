import SwiftUI

struct AdvertView: View {
    @State private var navigateToSearchLocation = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bg
                    .ignoresSafeArea()
                
                SearchHeader(value: 0.2, text: "Pekala, arama yapmak istediğin\nlokasyon nedir?")
                VStack {
                    Text("İlan Türü")
                        .font(.customFont(.extraBold, fontSize: 32))
                        .padding(.bottom, 30)
                    
                    NavigationLink(
                        destination: SearchProvince(),
                        isActive: $navigateToSearchLocation
                    ) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Button(action: {
                        saveAdvertType(type: "1")
                        navigateToSearchLocation = true
                    }, label: {
                        VStack {
                            Image("sold")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding(.bottom, 7)
                            
                            Text("Satılık İlanlar")
                                .font(.customFont(.extraBold, fontSize: 18))
                                .foregroundColor(.titleBlue)
                        }
                        .frame(width: 333, height: 138)
                        .background(Color.customWhite)
                        .cornerRadius(10)
                    })
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        saveAdvertType(type: "2")
                        navigateToSearchLocation = true
                    }, label: {
                        VStack {
                            Image("rent")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding(.bottom, 7)
                            
                            Text("Kiralık İlanlar")
                                .font(.customFont(.extraBold, fontSize: 18))
                                .foregroundColor(.titleBlue)
                        }
                        .frame(width: 333, height: 138)
                        .background(Color.customWhite)
                        .cornerRadius(10)
                    })
                }
                .padding(.bottom, 120)
                Spacer()
            }
            .background(Color.bg)
            .navigationBarHidden(true)
        }
    }
    
    func saveAdvertType(type: String) {
        UserDefaults.standard.set(type, forKey: "advertType")
    }
}

#Preview {
    AdvertView()
}
