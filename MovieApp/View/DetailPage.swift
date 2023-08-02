//
//  DetailPage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 31.07.2023.
//

import SwiftUI
import Kingfisher

struct DetailPage: View {
    @State var movie: MovieResult
    @State var favState: Bool
    @ObservedObject var viewModel: MovieDBViewModel
    
    var body: some View {
        
        VStack {
            DetailPageDesign(viewModel: viewModel, movie: movie )
            
        }
        .navigationTitle("Detail")
        .toolbar{
            Button {
                favState.toggle()
                if favState {
                    viewModel.favList.append(movie)
                    print("eklendi")
                } else {
                    if let removeMovie = viewModel.favList.firstIndex(of: movie) {
                        viewModel.favList.remove(at: removeMovie)
                    }
                    print("sil")
                }
                
            } label: {
                if favState {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: 18,height: 24)
                        .foregroundColor(.white)
                } else {
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 18,height: 24)
                        .foregroundColor(.white)
                }
                
            }
            
        }
        
        .onAppear{
            if viewModel.favList.contains(where: {$0.id == movie.id}) {
                favState = true
            } else {
                favState = false
            }
            
        }
        .background(Color("background"))
        
        
        
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(movie: MovieResult(adult: false, backdrop_path: "", genre_ids: [3], id: 1, original_language: "", original_title: "", overview: "", popularity: 1, poster_path: "", release_date: "", title: "", video: true, vote_average: 1, vote_count: 1), favState: false, viewModel: MovieDBViewModel())
    }
}
