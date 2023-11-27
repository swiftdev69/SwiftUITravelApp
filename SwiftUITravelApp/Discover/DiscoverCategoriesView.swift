//
//  DiscoverCategoriesView.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 04/11/23.
//

import SwiftUI
import SDWebImageSwiftUI
 
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
                    NavigationLink {
                        CategoryDetailsView()
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .foregroundColor(Color.orange)
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(64)
                                .shadow(color: .gray, radius: 4,x: 0.0, y: 2)
                            Text(category.name)
                                .font(.system(size: 12,weight: .semibold))
                                .foregroundColor(.white)
                        }.frame(width: 68)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailViewModel()
    
    var body: some View{
        ZStack {
            if vm.isLoading{
                VStack {
                    ActivityIndicatorView()
                    Text("Loading...")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
            }else{
                ScrollView {
                    ForEach(vm.places, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 0) {
                            WebImage(url: URL(string: item.thumbnail))
                                .resizable()
                                .indicator(.activity) // Activity Indicator
                                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                                .scaledToFill()
                            Text(item.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }
                        .asTile()
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        DiscoverView()
    }
}
