//
//  CategorySelectionCollectionViewCell.swift
//  ACNewsApp
//
//  Created by Ezgi Karahan on 16.06.2024.
//

import UIKit

final class CategorySelectionCollectionViewCell : UICollectionViewCell {
    
    static let cellIdentifier = "CategoryCollectionViewCell"
    
    //IMAGEVIEW
    var categoryImage : UIImageView = {
        
        var imageView = UIImageView()
        imageView.image = UIImage(named: "hotnews")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //LABEL
     let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 5
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .darkGray
        contentView.addSubviews(categoryImage, titleLabel)
        addConstraints()
        //setUpLayer()
    }
       
    required init?(coder: NSCoder) { ///storyboard ya da  xib başlatıcısı
        fatalError("Unsupported")    ///desteklenmediği için fatalError
    }
    
    private func addConstraints(){
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowColor = UIColor.gray.cgColor
        
        NSLayoutConstraint.activate([
            categoryImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryImage.heightAnchor.constraint(equalToConstant: 90),
            categoryImage.widthAnchor.constraint(equalToConstant: 90),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}
