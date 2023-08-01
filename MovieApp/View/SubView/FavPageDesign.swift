//
//  FavPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 1.08.2023.
//

import SwiftUI

struct FavPageDesign: View {
    var movie: MovieResult?
    var body: some View {
        if let title = movie?.original_title
            ,let average = movie?.vote_average
            ,let date = movie?.release_date
        {
            HStack {
                Image("r")
                    .resizable()
                    .frame(width: 100,height: 150)
                    .cornerRadius(15)
                VStack {
                    Text(title)
                    HStack{
                        Image(systemName: "star")
                        Text(String(format: "%.1f",  average))
                        Text("9.5")
                            .font(.system(size: 15))
                            .bold()
                    }
                    .frame(width: 120,height: 18,alignment: .leading)
                    HStack{
                        Image(systemName: "ticket")
                            .resizable()
                            .frame(width: 16,height: 16)
                        //let tur = genres.first
                        //Text(tur?.name ?? "")
                        Text("Action")
                    }
                    .frame(width: 120,height: 18,alignment: .leading)
                    HStack{
                        Image(systemName: "calendar.circle")
                            .resizable()
                            .frame(width: 16,height: 16)
                        //Text("\(date.prefix(4).description) |")
                        Text("2021")
                        
                    }
                    .frame(width: 120,height: 18,alignment: .leading)
                    HStack{
                        Image(systemName: "hourglass.circle")
                            .resizable()
                            .frame(width: 16,height: 16)
                       // Text("\(runTime) |")
                        Text("131 minutes")

                    }
                    .frame(width: 120,height: 18,alignment: .leading)
                    
                }
            }
            .frame(width: 305,height: 120,alignment: .leading)
            .padding(.top,20)
        }
        
    }
}

struct FavPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        FavPageDesign()
    }
}
