//
//  MovieVM.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 12/01/21.
//

import Foundation

class MovieVM {
    var movie: Movie
    
    var title: String { return movie.title}
    var posterImage : URL? { return URL(string: "https://image.tmdb.org/t/p/w400\(movie.image)")}
    var releaseDate : String {
        return movie.releaseDate
    }
    var qualification : String {
        return String(movie.qualification)
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}

class MovieDetailVM{
    var movie : MovieDetail
    var posterImage : URL? { return URL(string: "https://image.tmdb.org/t/p/w400\(movie.posterImg)")}
    var coverImage : URL? { return URL(string: "https://image.tmdb.org/t/p/w400\(movie.coverImg)")}
    var title : String { return movie.title}
    var rating : String { return String(movie.rating)}
    var description : String { return movie.description}
    var runtime: String { return String("\(movie.runtime) m")}
    var release: String { return  movie.releaseDate}
    var cat : String {
        returCat(cat: movie.genres)
    }
    
    
    
    func returCat(cat:[Gender]) -> String {
        
        var categorias: String = " "
        
        cat.forEach { gen in
            
            categorias += String(" \(gen.name) ")
        }
        
        return categorias
    }
    
    
    
    
    init(movieDetail: MovieDetail) {
        self.movie = movieDetail
    }
}
