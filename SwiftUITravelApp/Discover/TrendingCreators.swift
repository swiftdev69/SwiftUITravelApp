//
//  TrendingCreators.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 04/11/23.
//

import SwiftUI

struct TrendingCreators: View {
    
    let users: [User] = [.init(name: "Amy Adams", imageName: "amy"),
                         .init(name: "Billy", imageName: "billy"),
                         .init(name: "Sam Smith", imageName: "sam")]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creator")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id:\.self){ user in
                        VStack{
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(25)
                            Text(user.name)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .shadow(color: .gray, radius: 4,x: 0.0, y: 2)
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct TrendingCreators_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreators()
        DiscoverView()
    }
}
