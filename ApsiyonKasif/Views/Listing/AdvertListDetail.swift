//
//  AdvertListDetail.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI

struct AdvertListDetail: View {
    let listDetail: ListDetail?
    @State private var advertType: String = UserDefaults.standard.string(forKey: "advertType") ?? "Satılık"
    
    @StateObject private var viewModel = ListDetailViewModel()
    var body: some View {
        VStack{
            
            Text("İlan Bilgileri")
                .font(.customFont(.bold, fontSize: 18))
                .foregroundColor(.titleBlue)
                .padding(.top, 20)
                .maxLeft
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            VStack{
                HStack{
                    Text("İlan Numarası")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("#12442325")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("İlan Tarihi")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text(listDetail?.advert.advertDate ?? "")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("İlan Durumu")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    if advertType == "1"{
                        Text("Satılık")
                            .font(.customFont(.bold, fontSize: 14))
                            .foregroundColor(.titleBlue)
                    }else{
                        Text("Kiralık")
                            .font(.customFont(.bold, fontSize: 14))
                            .foregroundColor(.titleBlue)
                    }
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Metrekare")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("\(listDetail?.advert.netArea ?? "") m²")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Bina Yaşı")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("\(listDetail?.advert.buildingAge ?? 0)")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Kat Sayısı")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("\(listDetail?.advert.numberOfFloor ?? 0)")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Banyo Sayısı")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("\(listDetail?.advert.bathroomCount ?? 0)")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Kullanım Durumu")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("Boş")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Türü")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text("Konut")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Oda Sayısı")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text(listDetail?.advert.roomCount ?? "")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Bulunduğu Kat")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text(listDetail?.advert.floor ?? "")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Isıtma Tipi")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text(listDetail?.advert.heatingType ?? "")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Eşya Durumu")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    if listDetail?.advert.hasFurnished == true{
                        Text("Eşyalı")
                            .font(.customFont(.bold, fontSize: 14))
                            .foregroundColor(.titleBlue)
                    }else{
                        Text("Eşyasız")
                            .font(.customFont(.bold, fontSize: 14))
                            .foregroundColor(.titleBlue)
                    }
                    
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .fill(Color.customGray)
                    .frame(width: 333, height: 1)
                    .padding(.bottom, 15)
                    .opacity(0.1)
            }
            
            VStack{
                HStack{
                    Text("Site")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.customGray)
                    
                    Spacer()
                    
                    Text(listDetail?.advert.isInSite ?? "")
                        .font(.customFont(.bold, fontSize: 14))
                        .foregroundColor(.titleBlue)
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
            }
            
            
            
        }
        .frame(maxWidth: 333)
        .background(Color.customWhite)
        .cornerRadius(10)
        .padding(.bottom, 30)
    }
}
