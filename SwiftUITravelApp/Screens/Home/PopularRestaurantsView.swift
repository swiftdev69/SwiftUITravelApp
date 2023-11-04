//
//  PopularRestaurantsView.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 04/11/23.
//

import SwiftUI

struct Restaurant: Hashable{
    let name, imageName: String
}

struct PopularRestaurantsView : View{
    
    let restaurants: [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill")
    ]
    var body: some View{
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(restaurants, id:\.self){ restaurant  in
                        HStack(spacing: 8){
                            Image(restaurant.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(5)
                                .padding(.leading, 6)
                                .padding(.vertical, 6)
                            
                            VStack(alignment: .leading, spacing: 6){
                                HStack{
                                    Text(restaurant.name)
                                    Spacer()
//
                                    Button {
                                        // action goes here
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text("4.7 • Sushi • $$")
                                }
                                
                                Text("Japan's Finest Tapas")
                                  
                            }.font(.system(size: 12, weight: .semibold))
                            
                            Spacer()
                        }
                        .frame(width: 240)
                        .background(Color(.init(white: 0.9, alpha: 1)))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4,x: 0.0, y: 2)
                        .padding(.bottom)
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}
