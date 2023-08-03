//
//  MovieSearchPage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI
import Kingfisher

struct MovieSearchPage: View {
    @ObservedObject var viewModel: MovieDBViewModel
    @State var searchList = [MovieResult]()
    @State var search = ""
    var searchResult: [MovieResult] {
        return searchList.filter{$0.original_title!.localizedCaseInsensitiveContains(search)}
    }
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())],spacing: 20) {
                    ForEach(searchResult.prefix(30),id: \.self) { data in
                        SearchPageDesign(viewModel: viewModel, aramaYap: data)
                    }
   
                }
            }
            .background(Color("background"))
            .navigationTitle("Search Movie")
        }
        
        .searchable(text: $search,prompt: "Search Movies")
        .onAppear{
            UISearchBar.appearance().barTintColor = UIColor.white
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(.white)]
          

        }
        .onChange(of: search) { newSearch in
            if !newSearch.isEmpty {
                viewModel.fetchSearchMovie(search: newSearch) { result in
                    for x in result {
                        if !searchList.contains{$0.id == x.id} {
                            searchList.append(contentsOf: result)
                        } else {
                            return
                        }
                    }
                }
            } else {
                print("Hata")
            }
            
        }
        
        
    }
    
}



struct MovieSearchPage_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchPage(viewModel: MovieDBViewModel())
    }
}
