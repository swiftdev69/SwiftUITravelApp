//
//  DiscoverCategoriesView.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 04/11/23.
//

import SwiftUI

struct Category: Hashable {
    let name, imageName: String
}

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "fork.knife.circle"),
        .init(name: "History", imageName: "building.2.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(categories, id: \.self){ category in
                    VStack(spacing: 8) {
                        Image(systemName: category.imageName)
                            .foregroundColor(.white)
                            .frame(width: 64, height: 64)
                            .background(Color.gray)
                            .cornerRadius(64)
                            .shadow(color: .gray, radius: 4,x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12,weight: .semibold))
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        }
    }
}


//#Preview {
//    DiscoverCategoriesView()
//}
