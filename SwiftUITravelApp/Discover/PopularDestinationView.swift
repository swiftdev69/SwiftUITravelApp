//
//  PopularDestinationView.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 04/11/23.
//

import SwiftUI

struct PopularDestinationView : View{
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "new_york")
    ]
    
    var body: some View{
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(destinations, id:\.self){ destination in
                        VStack(alignment: .leading, spacing: 0) {
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 125)
                                .cornerRadius(4)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                            
                            Text(destination.name)
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal, 12)
                            
                            Text(destination.country)
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .foregroundColor(.gray)
                        }
                        .asTile()
                        .padding(.bottom)
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationView()
        DiscoverView()
    }
}
