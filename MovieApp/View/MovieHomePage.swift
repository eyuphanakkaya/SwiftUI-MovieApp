//
//  MovieHomePage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI
import Kingfisher

struct MovieHomePage: View {
    
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
                                NavigationLink(destination: DetailPage(movie: movie, favState: false, viewModel: viewModel)) {
                                    HomePageDesign(viewModel: viewModel,movie: movie)
                                
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
                        SubTitlePageDesign(viewModel: viewModel)
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
