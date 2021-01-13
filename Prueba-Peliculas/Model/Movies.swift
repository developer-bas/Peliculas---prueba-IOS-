//
//  File.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 12/01/21.
//

import Foundation


struct MovieResults : Decodable {
    let Movies : [Movie]
    let page : Int
    
    enum CodingKeys : String, CodingKey {
        case Movies = "results"
        case page = "page"
    }
    
    
   
}

struct Movie : Decodable{
    
    let image: String
    let title: String
    let releaseDate: String
    let qualification : Double
    let id : Int
    
    enum CodingKeys : String, CodingKey {
        case image = "poster_path"
        case title = "original_title"
        case releaseDate = "release_date"
        case qualification = "vote_average"
        case id = "id"
    }
    
}

struct MovieDetail : Decodable {
   
    let title: String
    let runtime: Int
    let coverImg : String
    let posterImg :String
    let rating : Double
    let releaseDate: String
    let genres : [Gender]
    let id : Int
    let description: String
    
    enum CodingKeys : String , CodingKey {
        
        case title = "title"
        case runtime = "runtime"
        case coverImg = "backdrop_path"
        case posterImg = "poster_path"
        case rating = "vote_average"
        case releaseDate = "release_date"
        case genres = "genres"
        case id = "id"
        case description = "overview"
        
    }
    
    
}

struct Gender : Decodable {
    let name : String
    
    enum CodingKeys : String, CodingKey {
        case name = "name"
    }
}


