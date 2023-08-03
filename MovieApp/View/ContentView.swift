//
//  ContentView.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MovieDBViewModel()
    var body: some View {
        ZStack {
            
            TabView {
               MovieHomePage(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("background"), for: .tabBar)
                    
                
                MovieSearchPage(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                        
                        
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("background"), for: .tabBar)
                MovieFavPage(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "bookmark")
                        Text("Watch list")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("background"), for: .tabBar)
    
            }
          
            
            
        }
        
       
      
       
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
