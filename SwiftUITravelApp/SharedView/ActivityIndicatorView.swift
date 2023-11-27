//
//  ActivityIndicatorView.swift
//  SwiftUITravelApp
//
//  Created by Sandeep Maurya on 18/11/23.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
