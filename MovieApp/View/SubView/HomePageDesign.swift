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
    var movie: MovieResult?
    var body: some View {
        if let poster = movie?.poster_path {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(poster)"))
                .resizable()
                .scaledToFit()
                .frame(width: 145, height: 210)
                .cornerRadius(16)
        }
    }
}

struct HomePageDesign_Previews: PreviewProvider {
    static var previews: some View {
        HomePageDesign(viewModel: MovieDBViewModel())
    }
}
