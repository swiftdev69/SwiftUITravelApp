//
//  ContentView.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 04/11/23.
//

import SwiftUI

extension Color{
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView{
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                            Spacer()
                    }.font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(10)
                        .padding(16)
                    
                    //Top Category
                    DiscoverCategoriesView()
                    
                    VStack{
                        //Destinations
                        PopularDestinationView()
                        
                        //Restaurants
                        PopularRestaurantsView()
                        
                        //Creators
                        TrendingCreators()
                    }.background(Color.discoverBackground)
                        .cornerRadius(16)
                        .padding(.top, 32)
                }
                .navigationTitle("Discover")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
