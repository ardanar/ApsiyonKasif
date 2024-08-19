import SwiftUI

struct ListingView: View {
    let listing: Listing
    @State private var advertType: String = UserDefaults.standard.string(forKey: "advertType") ?? "Satılık"
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: listing.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 125, height: 200)
                            .scaledToFit()
                            .maxLeft
                            .cornerRadius(10, corner: .topLeft)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 125)
                            .cornerRadius(10, corner: .topLeft)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 125)
                            .cornerRadius(10, corner: .topLeft)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.trailing, 15)
                
                VStack(alignment: .leading) {
                    Text("\(listing.price) ₺")
                        .font(.customFont(.extraBold, fontSize: 16))
                        .foregroundColor(.bgBlue)
                        .padding(.bottom, 8)
                    
                    Text(listing.title)
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
                    
                    Text("\(listing.cityName), \(listing.countyName)")
                        .font(.customFont(.medium, fontSize: 12))
                        .foregroundColor(.customGray)
                        .maxLeft
                    
                }
                .padding(.vertical, 10)
            }
            
            HStack {
                Image("room")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .padding(.trailing, 4)
                
                Text(listing.features.roomCount)
                    .font(.customFont(.bold, fontSize: 12))
                    .foregroundColor(.titleBlue)
                
                Spacer()
                
                Image("area")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text("\(listing.features.netArea) m²")
                    .font(.customFont(.bold, fontSize: 12))
                    .foregroundColor(.titleBlue)
                
                Spacer()
                
                Image("guide")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                if advertType == "1"{
                    Text("Satılık")
                        .font(.customFont(.bold, fontSize: 12))
                        .foregroundColor(.titleBlue)
                }else{
                    Text("Kiralık")
                        .font(.customFont(.bold, fontSize: 12))
                        .foregroundColor(.titleBlue)
                }
            }
            .padding(10)
        }
        .background(Color.customWhite)
        .cornerRadius(10)
    }
}
