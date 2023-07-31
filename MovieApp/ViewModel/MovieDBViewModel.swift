//
//  MovieDBViewModel.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import Foundation

class apiCaller {
    static let apiKey = "27126981b38143d748b09c881c9a3159"
    static let url = "https://api.themoviedb.org/3/"
    //https://api.themoviedb.org/3/trending/movie/day?api_key=27126981b38143d748b09c881c9a3159
}

class MovieDBViewModel: ObservableObject {
    @Published var trendList = [MovieDBResponse]()
    @Published var liste = [MovieDBResponse]()
    @Published var upcomingList = [MovieDBResponse]()
    @Published var nowPlayinList = [MovieDBResponse]()
    @Published var populerList = [MovieDBResponse]()
    @Published var searchList = [MovieDBResponse]()
    
    func loadTrending() {
        urlSessionGet(apiKeys: "\(apiCaller.url)trending/movie/day?api_key=\(apiCaller.apiKey)"){ result in
            print("DEBUG: before append")
            self.trendList.append(result)
            self.liste = self.trendList
            print("DEBUG: after append")
        }
        
    }
        func loadUpComing() {
            urlSessionGet(apiKeys: "\(apiCaller.url)movie/upcoming?api_key=\(apiCaller.apiKey)") {result in
                self.upcomingList.append(result)
                self.liste = self.upcomingList
            }
        }
        func loadNowPlaying() {
            urlSessionGet(apiKeys: "\(apiCaller.url)movie/now_playing?api_key=\(apiCaller.apiKey)") {result in
                self.nowPlayinList.append(result)
                self.liste = self.nowPlayinList
            }
        }
        func loadPopular(){
            urlSessionGet(apiKeys: "\(apiCaller.url)movie/popular?api_key=\(apiCaller.apiKey)&limit=6") {result in
                self.populerList.append(result)
                self.liste = self.populerList
            }
        }
        //https://api.themoviedb.org/3/search/movie?query=Barbie&api_key=27126981b38143d748b09c881c9a3159
        func searchMovie(search: String){
            urlSessionGet(apiKeys: "\(apiCaller.url)search/movie?query=\(search)&api_key=\(apiCaller.apiKey)") {result in
                self.searchList.append(result)
            }
        }

    func urlSessionGet(apiKeys: String, completion: @escaping(MovieDBResponse)-> Void) {
        let url = URL(string: apiKeys)
        if let incomingUrl = url {
            URLSession.shared.dataTask(with: incomingUrl) { data, response, error in
                guard error != nil || data != nil else{
                    print("HATAAAA= \(error)")
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MovieDBResponse.self, from: data!)
                    DispatchQueue.main.async {
                   // print(result)
                    completion(result)
                }
                   
                } catch {
                    print("HATAAAA= \(error)")
                }
            }.resume()
        }
    }
}

