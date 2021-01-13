//
//  MovieDetailView.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 13/01/21.
//

import UIKit
import Kingfisher


class MovieDetailView: UIView {
    //    MARK: - PropertiesView
    
    
    var viewModel: MovieDetailVM? {
        didSet {
            ConfigureUI()
        }
    }

    private lazy var posterImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.backgroundColor = .lightGray
        return image
    }()
    
    private lazy var coverImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.backgroundColor = .lightGray
        return image
    }()
    
    
    private let title : UILabel = {
       let label = UILabel()
        
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let releaseDate : UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let rating : UILabel = {
        let label = UILabel()
        
         label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
         
        return label
    }()
    
    private let descriptio : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
   
    private let runtime : UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let calificacion : UILabel =  {
        let label = UILabel()
        label.text =  "Clasificación : "
         label.textColor = UIColor.black
         label.font = UIFont.boldSystemFont(ofSize: 15)
         return label
    }()
    
    private let duracion : UILabel =  {
        let label = UILabel()
        label.text =  "Duración : "
         label.textColor = UIColor.black
         label.font = UIFont.boldSystemFont(ofSize: 15)
         return label
    }()
    
    private let fecha : UILabel =  {
        let label = UILabel()
        label.text =  "Fecha de estreno : "
         label.textColor = UIColor.black
         label.font = UIFont.boldSystemFont(ofSize: 15)
         return label
    }()
    
    private let descripcion : UILabel =  {
        let label = UILabel()
        label.text =  "Descripción"
         label.textColor = UIColor.black
         label.font = UIFont.boldSystemFont(ofSize: 15)
         return label
    }()
    private let starImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private let category : UILabel =  {
        let label = UILabel()
        label.numberOfLines = 0
         label.textColor = UIColor.black
         label.font = UIFont.boldSystemFont(ofSize: 15)
         return label
    }()
    
    
    
    //    MARK: - LifecycleView
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(coverImage)
        coverImage.anchor(top: topAnchor, left: leftAnchor,right: rightAnchor)
        coverImage.setHeight(200)
        
        addSubview(posterImage)
        posterImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 150, paddingLeft: 150)
        posterImage.setHeight(120)
        posterImage.setWidth(70)
        
        addSubview(title)
        title.anchor(top: coverImage.bottomAnchor, paddingTop: 100)
        title.centerX(inView: coverImage)
        
        let stackR = UIStackView(arrangedSubviews: [calificacion,rating, starImage])
        stackR.axis = .horizontal
        stackR.spacing = 6
        
        addSubview(stackR)
        stackR.anchor(top: title.bottomAnchor,left: leftAnchor,paddingTop: 10, paddingLeft: 40)
        
        let stackD = UIStackView(arrangedSubviews: [duracion,runtime])
        stackD.axis = .horizontal
        stackD.spacing = 6
        
        addSubview(stackD)
        stackD.anchor(top: stackR.bottomAnchor,left: leftAnchor,paddingTop: 10, paddingLeft: 40)
        
        let stackF  = UIStackView(arrangedSubviews: [fecha,releaseDate])
        stackF.axis = .horizontal
        stackF.spacing = 6
        
        addSubview(stackF)
        stackF.anchor(top: stackD.bottomAnchor,left: leftAnchor,paddingTop: 10, paddingLeft: 40)
        
    
        addSubview(category)
        category.anchor(top:stackF.bottomAnchor,paddingTop: 14,paddingLeft: 2,paddingRight: 2)
        category.centerX(inView: posterImage)
        
        
        addSubview(descripcion)
        descripcion.anchor(top:category.bottomAnchor,paddingTop: 14)
        descripcion.centerX(inView: posterImage)
        
        addSubview(descriptio)
        descriptio.anchor(top: descripcion.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 14,paddingLeft: 20,paddingRight: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    func ConfigureUI(){
        guard let viewModel = viewModel else {return}
        
        DispatchQueue.main.async {
            self.posterImage.kf.setImage(with: viewModel.posterImage)
            self.coverImage.kf.setImage(with: viewModel.coverImage)
            self.title.text = viewModel.title
            self.rating.text = viewModel.rating
            self.runtime.text = viewModel.runtime
            self.releaseDate.text = viewModel.release
            self.descriptio.text = viewModel.description
            self.starImage.image = UIImage(systemName: "star.lefthalf.fill")
            self.starImage.tintColor = UIColor.black.withAlphaComponent(0.7)
            self.category.text = viewModel.cat
        }
        
        
      
    }
        
    
  
    

}




