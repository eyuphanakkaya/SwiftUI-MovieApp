//
//  MovieModel.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import Foundation

struct MovieDBResponse: Hashable,Codable {
    let page: Int
    let results: [MovieResult]
    let total_pages: Int
    let total_results: Int
}

struct MovieResult: Hashable,Codable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Float?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Float?
    let vote_count: Int?
}

struct MovieDetail: Codable,Hashable {
    let genres: [Genres]
    let id: Int
    let runtime: Int
    let original_title: String
    let poster_path: String
    let release_date: String
    
    
}
struct Genres: Hashable,Codable {
    let id: Int
    let name: String
}
struct Actors: Codable,Hashable {
    let id: Int?
    let cast: [Cast]?
}
struct Cast: Codable,Hashable{
    let id: Int?
    let name: String?
    let profile_path: String?
}

