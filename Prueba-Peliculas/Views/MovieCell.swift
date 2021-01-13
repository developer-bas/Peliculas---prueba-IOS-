//
//  MovieCell.swift
//  Prueba-Peliculas
//
//  Created by PROGRAMAR on 12/01/21.
//

import UIKit
import Kingfisher

class MovieCell : UICollectionViewCell {

    
    //    MARK: - Properties
    
    var viewModel : MovieVM? {
        didSet{
            configureUI()
        }
    }
    
    lazy var posterImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.backgroundColor = .lightGray
        return image
    }()
    
    private let title : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let releaseDate : UILabel = {
       let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let rating : UILabel = {
       let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let viewBG: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return background
    }()
    
    private let starImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    //    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(posterImage)
        posterImage.anchor(top:topAnchor,left: leftAnchor, bottom: bottomAnchor,right: rightAnchor)
        posterImage.layer.cornerRadius = 40/2
        
        addSubview(viewBG)
        viewBG.anchor(left: leftAnchor,bottom: bottomAnchor, right: rightAnchor)
        viewBG.setHeight(60)
        viewBG.layer.cornerRadius = 40/2
        viewBG.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]

        
     
        
        let stack = UIStackView(arrangedSubviews: [releaseDate,starImage,rating])
        stack.axis = .horizontal
        stack.spacing = 6
        stack.alignment = .fill
        
        addSubview(stack)
        stack.anchor(bottom: bottomAnchor,paddingBottom: 4)
        stack.centerX(inView: posterImage)
        
        
        addSubview(title)
        title.centerX(inView: posterImage)
        title.anchor(top:viewBG.topAnchor, left: leftAnchor, bottom: stack.topAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    func configureUI(){
        guard let viewModel = viewModel else {return}
        posterImage.kf.setImage(with: viewModel.posterImage)
        title.text = viewModel.title
        rating.text = viewModel.qualification
        releaseDate.text = viewModel.releaseDate
        starImage.image = UIImage(systemName: "star")
        starImage.tintColor = UIColor.yellow.withAlphaComponent(0.7)
    }
    
}
