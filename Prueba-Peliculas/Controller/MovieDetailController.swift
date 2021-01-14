//
//  MovieDetailController.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 13/01/21.
//

import UIKit

class MovieDetailController: UIViewController {
    
    //    MARK: - Properties
    
    var id : Int?
    var movie : MovieDetail?
    var movieDV = MovieDetailView()
    
    //    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        showLoader(true)
        getMovie()
        configureUI()
    }
    
    //  MARK: - Helpers
    
    func configureUI(){
        view.addSubview(movieDV)
        movieDV.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,right: view.rightAnchor)
    }
    
    func getMovie(){
        guard let id = id else {return}
        
        MovieService.getMovieByID(movieID: id) { (mov) in
            self.movie = mov
            self.movieDV.viewModel = MovieDetailVM(movieDetail: mov)
            DispatchQueue.main.async {
                self.showLoader(false)
            }
        }
    }
}
