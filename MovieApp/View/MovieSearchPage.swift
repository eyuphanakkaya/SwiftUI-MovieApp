//
//  MovieSearchPage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI

struct MovieSearchPage: View {
    @State var search = ""
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())]) {
                HStack {
                    Image("resim")
                        .resizable()
                        .frame(width: 100,height: 150)
                        .cornerRadius(16)
                    VStack(alignment: .leading) {
                        Text("Spiderman")
                            .padding(.leading,20)
                        HStack {
                            Image(systemName: "star")
                            Text(String(format: "%.1f",  ""))
                                .font(.system(size: 15))
                                .bold()
                               
                        }
                        HStack {
                            Image(systemName: "ticket")
                            Text("Action")
                            
                        }
                        HStack {
                            Image(systemName: "calendar.circle")
                            Text("2021")
                        }
                        HStack {
                            Image(systemName: "hourglass.circle")
                            Text("139 minutes")
                        }
                    }
                    
                }
               
                .frame(width: 305,height: 120,alignment: .leading)
                .padding(.top,20)
            }
        } .searchable(text: $search)
    }
}

struct MovieSearchPage_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchPage()
    }
}
