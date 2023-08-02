//
//  DetailPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 31.07.2023.
//

import SwiftUI
import Kingfisher

struct SubTitlePageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
   
    var body: some View {
        ForEach(viewModel.liste.flatMap(\.results),id: \.self) { movie in
                if let gelenPoster = movie.poster_path {
                    NavigationLink(destination: DetailPage(movie: movie, favState: false, viewModel: viewModel)) {
                        KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(gelenPoster)"))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .cornerRadius(16)
                    }
                }
        } .onAppear{
            viewModel.loadNowPlaying()
        }
    }
}



struct SubTitlePageDesign_Previews: PreviewProvider {
    static var previews: some View {
        SubTitlePageDesign(viewModel: MovieDBViewModel() )
    }
}
