//
//  DetailPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 31.07.2023.
//

import SwiftUI
import Kingfisher

struct DetailPageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
   
    var body: some View {
        ForEach(viewModel.liste.flatMap(\.results),id: \.self) { movie in
                if let gelenPoster = movie.poster_path {
                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(gelenPoster)"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                            .cornerRadius(16)
                }
            }    
    }
}



struct DetailPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageDesign(viewModel: MovieDBViewModel() )
    }
}
