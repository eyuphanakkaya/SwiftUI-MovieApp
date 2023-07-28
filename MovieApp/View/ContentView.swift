//
//  ContentView.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                MovieHomePage( ara: "")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                MovieSearchPage()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                MovieFavPage()
                    .tabItem {
                        Image(systemName: "bookmark")
                        Text("Watch list")
                    }
            }
            .background(Color.blue)
          
        }
       
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
