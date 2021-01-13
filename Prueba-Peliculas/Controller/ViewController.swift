//
//  ViewController.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 12/01/21.
//

import UIKit

private let reuseIdentifier = "MovieCell"

class ViewController: UIViewController {

    //    MARK: - Properties
    private var movies = [Movie]()
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(MovieCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        cv.refreshControl = refresher

        return cv

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        configureUI()
        fetchMovies()
    
    }
    
//    MARK : API
    func fetchMovies(){
        MovieService.getNowPlayingMovies { mov in
            self.movies = mov
            DispatchQueue.main.async {
                self.collectionView.refreshControl?.endRefreshing()
            }
        }
        
    }
    
//    MARK : - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Peliculas"
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingBottom: 5, paddingLeft: 7, paddingRight: 7)
    }
    
//    MARK: - Actions
    @objc func handleRefresh(){
        movies.removeAll()
        fetchMovies()
    }

}

//MARK: - UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
        cell.viewModel = MovieVM(movie: movies[indexPath.row])
        
        return cell
    }
    
    
}
//MARK: - UICollectionViewDelegate
extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = MovieDetailController()
        controller.id = movies[indexPath.row].id
        self.navigationController?.pushViewController(controller, animated: true)
       
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 24) / 2
        let height = (view.frame.height - 10) / 2.8
        return CGSize(width: width, height: height)
    }
}

