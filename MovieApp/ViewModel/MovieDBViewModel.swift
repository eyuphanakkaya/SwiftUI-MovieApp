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
    @Published var favList = [MovieResult]()
    @Published var trendList = [MovieDBResponse]()
    @Published var liste = [MovieDBResponse]()
    @Published var upcomingList = [MovieDBResponse]()
    @Published var nowPlayinList = [MovieDBResponse]()
    @Published var populerList = [MovieDBResponse]()
    @Published var detailList = [MovieDetail]()
//    @Published var actorList = [Actors]()
    
    func loadTrending() {
        urlSessionGet(apiKeys: "\(apiCaller.url)trending/movie/day?api_key=\(apiCaller.apiKey)"){ result in
            self.trendList.append(result)
            self.liste = self.trendList
         
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
        urlSessionGet(apiKeys: "\(apiCaller.url)movie/popular?api_key=\(apiCaller.apiKey)&limit=6"){result in
            self.populerList.append(result)
            self.liste = self.populerList
            
        }
    }
    //https://api.themoviedb.org/3/search/movie?query=Barbie&api_key=27126981b38143d748b09c881c9a3159
    func loadDetail(id: Int) {
        getMovieDetail(id: id) { result in
            self.detailList.append(result)
        }
    }
    func fetchSearchMovie(search: String,completion: @escaping([MovieResult])-> Void) {
        let url = URL(string: "\(apiCaller.url)search/movie?query=\(search)&api_key=\(apiCaller.apiKey)")
        if let incomingUrl = url {
            URLSession.shared.dataTask(with: incomingUrl) { data, response, error in
                guard error != nil || data != nil else{return}
                do {
                    let result = try JSONDecoder().decode(MovieDBResponse.self, from: data!)
                   // print(result)
                    DispatchQueue.main.async {
                        completion(result.results)
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    }

    //https://api.themoviedb.org/3/movie/457332?api_key=27126981b38143d748b09c881c9a3159
    
    func getMovieDetail(id: Int,completion: @escaping(MovieDetail)-> Void) {
        let url = URL(string: "\(apiCaller.url)movie/\(id)?api_key=\(apiCaller.apiKey)")
        if let incomingUrl = url {
            URLSession.shared.dataTask(with: incomingUrl) { data, response, error in
                guard error != nil || data != nil else{return}
                do {
                    let result = try JSONDecoder().decode(MovieDetail.self, from: data!)
                    DispatchQueue.main.async {
                        completion(result)
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
    func fetchActors(id: Int,completion: @escaping(Actors)-> Void) {
        let url = URL(string: "\(apiCaller.url)movie/\(id)/credits?api_key=\(apiCaller.apiKey)")
        if let incomingUrl = url {
            URLSession.shared.dataTask(with: incomingUrl) { data, response, error in
                guard error != nil || data != nil else{
                    print(error)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Actors.self, from: data!)
                   // self.actorList.append(result)
                    completion(result)
                } catch {
                    print(error)
                }
            }.resume()
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

