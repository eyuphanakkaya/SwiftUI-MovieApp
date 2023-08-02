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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())],spacing: 20) {
                    ForEach(viewModel.favList,id: \.self) { data in
                        NavigationLink(destination: DetailPage(movie: data, favState: false, viewModel: viewModel)) {
                            FavPageDesign(viewModel: viewModel, movie: data)
                        }
                        
                    }
                }
            }
            .background(Color("background"))
            
        }
        

        

    }
}

struct MovieFavPage_Previews: PreviewProvider {
    static var previews: some View {
        MovieFavPage(viewModel: MovieDBViewModel())
    }
}
