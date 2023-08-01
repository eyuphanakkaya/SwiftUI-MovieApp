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
    @State var movieDetail: MovieDetail?
    @State var favState: Bool
    @ObservedObject var viewModel: MovieDBViewModel
    
    var body: some View {
        
        VStack {
            if let backDrop = movie.backdrop_path
                ,let poster = movie.poster_path
                ,let title = movie.title
                ,let average = movie.vote_average
                ,let date = movie.release_date
                ,let runTime = movieDetail?.runtime
                ,let genres = movieDetail?.genres
                ,let overview = movie.overview {
                
                ZStack {
                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(backDrop)"))
                        .resizable()
                        .frame(width: 400,height: 210)
                        .padding(.top, 16)
                        .cornerRadius(16)
                        .padding(.top, -16)
                    
                }
                .padding(.top,40)
                HStack {
                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(poster)"))
                        .resizable()
                        .frame(width: 90,height: 130)
                        .scaledToFit()
                        .cornerRadius(16)
                        .offset(x: 30,y: -60)
                    
                    VStack{
                        Image(systemName: "star")
                        Text(String(format: "%.1f", average))
                            .font(.system(size: 15))
                            .bold()
                        
                    }
                    .offset(x:250,y:-90)
                    .foregroundColor(.white)
                    Text(title)
                        .frame(width: 250, height: 70)
                        .font(Font.custom("Helvetica", size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: -10,y:-35)
                    
                }
                HStack {
                    Image(systemName: "calendar.circle")
                    Text("\(date.prefix(4).description) |")
                    
                    Image(systemName: "hourglass.circle")
                    Text("\(runTime) |")
                    Image(systemName: "ticket")
                    let tur = genres.first
                    Text(tur?.name ?? "")
                }
                .foregroundColor(.gray)
                .frame(width: 300,height: 32)
                .font(Font.custom("Helvetica", size: 16))
                .padding()
                .offset(y:-60)
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        Button {
                            //  viewModel.loadNowPlaying()
                        } label: {
                            Text("About Movie")
                                .foregroundColor(.white)
                        }
                        
                        .padding(.leading,20)
                        Button {
                            //  viewModel.loadUpComing()
                        } label: {
                            Text("Reviews")
                                .foregroundColor(.white)
                        }
                        Button {
                            // viewModel.loadPopular()
                            
                        } label: {
                            Text("Cast")
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                }
                .offset(y:-70)
                .padding()
                Text(overview)
                    .frame(width: 317,height: 200)
                    .offset(y:-100)
                    .foregroundColor(.white)
                    .padding(.top,20)
            }
            
        }
        .navigationTitle("Detail")
        .toolbar{
            Button {
                favState.toggle()
                if favState {
                    viewModel.favList.append(movie)
                    print("eklendi")
                } else {
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
            viewModel.getMovieDetail(id: movie.id ?? 0) { result in
                self.movieDetail = result
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
