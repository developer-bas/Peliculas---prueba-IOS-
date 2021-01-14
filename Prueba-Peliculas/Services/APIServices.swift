//
//  APIServices.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 12/01/21.
//

import Foundation

struct MovieService {
    
    static func getNowPlayingMovies(page: Int,completion: @escaping ([Movie])->Void){
        
        let url   = "https://api.themoviedb.org/3/movie/now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-MX&page=\(page)"
        
         let task = URLSession.shared.dataTask(with: URL(string: url)!){ data, response, error in
            
            guard let data = data , error == nil else { return }
            var result : MovieResults?
            
            do{
                result = try JSONDecoder().decode(MovieResults.self, from: data)
            }catch{
                print("Esto salio mal : \(error)")
            }
            
            guard let json = result else {return}
            var movies = [Movie]()
            
            json.Movies.forEach { movie in
                movies.append(movie)
            }
            completion(movies)
        }
        task.resume()
    }
    
    static func getMovieByID(movieID id : Int, completion: @escaping(MovieDetail)->Void){
        
        DispatchQueue.main.async {
            let url = "https://api.themoviedb.org/3/movie/\(id)?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-MX"
            let task = URLSession.shared.dataTask(with: URL(string: url)!){ data, response , error in
                
                guard let data = data , error == nil else {return}
                var result: MovieDetail?
                
                do {
                    result = try JSONDecoder().decode(MovieDetail.self,from: data)
                }catch{
                    print("Ocurrio un error \(error)")
                }
                
                guard let json = result else {return}
                
                completion(json)
                
            }
            task.resume()
        }
        
        
        
    }
}
