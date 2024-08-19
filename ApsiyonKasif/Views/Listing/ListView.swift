import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg
                    .ignoresSafeArea()
                
                VStack {
                    HeaderView() 
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                            .padding()
                    } else if viewModel.listings.isEmpty {
                        VStack {
                            Text("İlan bulunamadı")
                                .font(.customFont(.semiBold, fontSize: 16))
                                .foregroundColor(.customWhite)
                                .padding()
                                .background(Color.bgBlue)
                                .cornerRadius(10)
                            Spacer()
                        }
                        .padding(.top, 30)
                    } else {
                        ScrollView {
                            VStack(spacing: 15) {
                                ForEach(viewModel.listings) { listing in
                                    NavigationLink(destination: ListingDetailView(listing: listing)
                                        .onAppear {
                                            UserDefaults.standard.set(listing.id, forKey: "advertId")
                                            print("advertId saved: \(listing.id)")
                                        }
                                        .navigationBarHidden(true)) {
                                        ListingView(listing: listing)
                                    }
                                    .padding(.horizontal, 35)
                                }
                            }
                            .padding(.top, 30)
                        }
                        .padding(.top, -280)
                    }
                    
                    VStack {
                        HStack {
                            Image("iconPrimary")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                                .padding(.trailing, 15)
                            
                            Text("Arama kriterlerine göre sana en\n uygun ilanları listeledim!")
                                .font(.customFont(.semiBold, fontSize: 14))
                                .foregroundColor(.customWhite)
                                .frame(width: 253, height: 62)
                                .background(Color.bgBlue)
                                .cornerRadius(10, corner: [.bottomRight, .topLeft, .topRight])
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                }
            }
            .onAppear {
                viewModel.fetchListings()
            }
        }
    }
}

#Preview {
    ListView()
}
