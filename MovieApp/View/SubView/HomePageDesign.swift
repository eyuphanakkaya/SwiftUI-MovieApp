//
//  HomePageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI
import Kingfisher

struct HomePageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
   
    var body: some View {
        
        Text("")
        
    }
}

struct HomePageDesign_Previews: PreviewProvider {
    static var previews: some View {
        HomePageDesign(viewModel: MovieDBViewModel())
    }
}
