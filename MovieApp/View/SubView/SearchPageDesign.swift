//
//  SearchPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 3.08.2023.
//

import SwiftUI
import Kingfisher

struct SearchPageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
    @State var aramaYap: MovieResult?
    @State var movieDetail: MovieDetail?
    var body: some View {
        if let title = aramaYap?.original_title
            ,let average = aramaYap?.vote_average
            ,let date = aramaYap?.release_date
            ,let poster = aramaYap?.poster_path
        {
            if let makeSearch = aramaYap {
                NavigationLink(destination: DetailPage(movie: makeSearch, favState: false, viewModel: viewModel)) {
                    HStack {

                        KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(poster)"))
                            .resizable()
                            .frame(width: 100,height: 150)
                            .cornerRadius(15)
                            
                        VStack(alignment: .leading) {
                            Text(title)
                                .bold()
                                .font(.system(size: 16))
                                .frame(width: 200,height: 40,alignment: .center)
                            
                            HStack{
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                Text(String(format: "%.1f",  average))
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .foregroundColor(.orange)
                            .frame(width: 120,height: 18,alignment: .leading)
                            HStack{
                                Image(systemName: "ticket")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                let tur = movieDetail?.genres?.first
                                Text(tur?.name ?? "" )
                            }
                            .frame(width: 120,height: 18,alignment: .leading)
                            HStack{
                                Image(systemName: "calendar.circle")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                Text("\(date.prefix(4).description) ")
                                
                            }
                            .frame(width: 120,height: 18,alignment: .leading)
                            HStack{
                                Image(systemName: "hourglass.circle")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                Text("\(movieDetail?.runtime ?? 0) minutes")
                                
                                
                            }
                            .frame(width: 120,height: 18,alignment: .leading)
                            
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 305,height: 120,alignment: .leading)
                    .padding(.top,20)
                    
                    .onAppear{
                        //print("BAŞLIK\(aramaYap?.original_title)")
                        viewModel.getMovieDetail(id: aramaYap?.id ?? 0) { detail in
                            //print("DETAYYYY\(detail)")
                            self.movieDetail = detail
                        }
                    }
                }
            }


        }
    }
}

struct SearchPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageDesign(viewModel: MovieDBViewModel())
    }
}
