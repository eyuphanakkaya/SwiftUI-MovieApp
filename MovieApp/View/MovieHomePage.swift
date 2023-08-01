//
//  MovieHomePage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI
import Kingfisher

struct MovieHomePage: View {
    
    @State private var nowPlay: [MovieDBResponse] = []
    @State private var upComing: [MovieDBResponse] = []
    @State private var popular: [MovieDBResponse] = []
    @State var selected: MovieDBResponse?
    @ObservedObject var viewModel: MovieDBViewModel
    @State var ara: String
    var body: some View {
        NavigationView {
            VStack {
                
                Text("What do you want to watch?")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading)
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.trendList.flatMap(\.results),id: \.self) { movie in
                            if let gelenPoster = movie.poster_path {
                                NavigationLink(destination: DetailPage(movie: movie, favState: false, viewModel: viewModel)) {
                                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(gelenPoster)"))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 145, height: 210)
                                        .cornerRadius(16)

                                }
                                
                            }

                        }
                    }
                    
                }
                .padding()
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        Button {
                            viewModel.loadNowPlaying()
                        } label: {
                            Text("Now playing")
                                .foregroundColor(.white)
                        }
                        .padding(.leading,20)
                        Button {
                            viewModel.loadUpComing()
                        } label: {
                            Text("Upcoming")
                                .foregroundColor(.white)
                        }
                        Button {
                            viewModel.loadPopular()
                            
                        } label: {
                            Text("Popular")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]) {
                        DetailPageDesign(viewModel: viewModel)
                    }
                }
                
            }
            .background(Color("background"))
        }
        
        .onAppear{

            viewModel.loadTrending()
        }
        
        
    }
    
    
}

struct MovieHomePage_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomePage(viewModel: MovieDBViewModel(), ara: "")
    }
}
