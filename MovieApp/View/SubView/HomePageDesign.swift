//
//  HomePageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI

struct HomePageDesign: View {
    var body: some View {
        VStack {
            Image("alya")
                .resizable()
                .scaledToFit()
                .frame(width: 145,height: 210)
                .cornerRadius(16)
        }
        
    }
}

struct HomePageDesign_Previews: PreviewProvider {
    static var previews: some View {
        HomePageDesign()
    }
}
