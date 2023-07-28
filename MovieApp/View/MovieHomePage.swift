//
//  MovieHomePage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI

struct MovieHomePage: View {
    @State private var nowPlay: [MovieDBResponse] = []
    @State private var upComing: [MovieDBResponse] = []
    @State private var popular: [MovieDBResponse] = []
    @ObservedObject var viewModel = MovieDBViewModel()
    @State var ara: String
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        HomePageDesign()
                        HomePageDesign()
                        HomePageDesign()
                        HomePageDesign()
                    }

                }
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        Button {
                            viewModel.loadNowPlaying()
                        } label: {
                            Text("Now playing")
                        }
                        .padding(.leading,20)
                        Button {
                            viewModel.loadUpComing()
                        } label: {
                            Text("Upcoming")
                        }
                        Button {
                            viewModel.loadPopular()
                        } label: {
                            Text("Popular")
                        }
                    }
                }
                
            }
           
            
        }.searchable(text: $ara)
            .onAppear{
                viewModel.searchMovie(search: "Barbie")
            }
    }
        
}

struct MovieHomePage_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomePage( ara: "")
    }
}
