//
//  DetailPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 2.08.2023.
//

import SwiftUI
import Kingfisher

struct DetailPageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
    @State var movie: MovieResult
    @State var movieDetail: MovieDetail?
    @State var actors: Actors?
    @State var number =  1
    var body: some View {
        if let backDrop = movie.backdrop_path
            ,let poster = movie.poster_path
            ,let title = movie.title
            ,let average = movie.vote_average
            ,let date = movie.release_date
            ,let overview = movie.overview
        {
            
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
                Text("\(movieDetail?.runtime ?? 0) minutes |")
                Image(systemName: "ticket")
                
                if  let tur = movieDetail?.genres?.first {
                    Text(tur.name ?? "")
                }
                
            }
            .foregroundColor(.gray)
            .frame(width: 350,height: 32)
            .font(Font.custom("Helvetica", size: 16))
            .padding()
            .offset(y:-60)
            ScrollView(.horizontal) {
                HStack(spacing: 50) {
                    Button {
                        self.number = 1
                    } label: {
                        Text("About Movie")
                            .foregroundColor(.white)
                    }
                    
                    .padding(.leading,20)
                    Button {
                        self.number = 2
                    } label: {
                        Text("Reviews")
                            .foregroundColor(.white)
                    }
                    Button {
                        self.number = 3
                    } label: {
                        Text("Cast")
                            .foregroundColor(.white)
                    }
                }
                
                
            }
            .onAppear{
                viewModel.getMovieDetail(id: movie.id ?? 0) { detail in
                    self.movieDetail = detail
                }
                viewModel.fetchActors(id: movie.id ?? 0) { actors in
                    self.actors = actors
                }
               
            }
            .offset(y:-70)
            .padding()
            switch number {
            case 1:
                Text(overview)
                    .frame(width: 317,height: 200)
                    .offset(y:-100)
                    .foregroundColor(.white)
                    .padding(.top,20)
            case 2:
                Text("Yorumlar")
            case 3:
                ActorPageDesign(viewModel: viewModel,movie: movie)
                    .frame(width: 350,height: 200)
                    .offset(y:-60)
            default:
                Text("")
            }
           
        }
    }
    
}

struct DetailPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageDesign(viewModel: MovieDBViewModel(), movie: MovieResult(adult: false, backdrop_path: "", genre_ids: [3], id: 1, original_language: "", original_title: "", overview: "", popularity: 1, poster_path: "", release_date: "", title: "", video: false, vote_average: 1, vote_count: 1))
    }
}
