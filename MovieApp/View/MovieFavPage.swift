//
//  MovieFavPage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI

struct MovieFavPage: View {
    @State var detail: MovieDetail?
    @ObservedObject var viewModel: MovieDBViewModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())],spacing: 20) {
                ForEach(viewModel.favList,id: \.self) { data in
                    FavPageDesign(movie: data)
                }
            }
        }
        .onAppear{
          
        }
        

    }
}

struct MovieFavPage_Previews: PreviewProvider {
    static var previews: some View {
        MovieFavPage(viewModel: MovieDBViewModel())
    }
}
