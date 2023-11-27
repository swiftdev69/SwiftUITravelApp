//
//  CategoryDetailViewModel.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 18/11/23.
//

import Foundation

class CategoryDetailViewModel: ObservableObject{
    
    @Published var isLoading = true
    @Published var places = [Place]()
    
    init(){
        
        // real network code
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                guard let data = data else {return}
                do{
                    self.places =  try JSONDecoder().decode( [Place].self, from: data)
                }catch{
                    print("failed to decode json \(error.localizedDescription)")
                }
                
                self.isLoading = false
            }
        }.resume()
    }
}
