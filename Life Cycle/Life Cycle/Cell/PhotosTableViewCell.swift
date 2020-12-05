//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 16.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setContent()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContent()
    }
    
    //MARK: - Views
    
    private lazy var photosLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "arrow.png")
        imageView.image = image
        return imageView
    }()
    
    private lazy var photosImageViewOne: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "Airplane")
        imageView.image = image
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var photosImageViewTwo: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "Moon")
        imageView.image = image
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var photosImageViewThree: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "Animal")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var photosImageViewFour: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "river")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    //MARK: - Layout Setting
    
    private func setContent() {
        
        setSubviews()
        
        NSLayoutConstraint.activate([
            
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.bottomAnchor.constraint(equalTo: photosImageViewOne.topAnchor, constant: -12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -12),
            
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photosImageViewOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosImageViewOne.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewOne.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosImageViewOne.trailingAnchor.constraint(equalTo: photosImageViewTwo.leadingAnchor, constant: -8),
            photosImageViewOne.widthAnchor.constraint(equalTo: photosImageViewTwo.widthAnchor),
            photosImageViewOne.heightAnchor.constraint(equalToConstant: 75),
            
            photosImageViewTwo.leadingAnchor.constraint(equalTo: photosImageViewOne.trailingAnchor, constant: 8),
            photosImageViewTwo.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewTwo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosImageViewTwo.trailingAnchor.constraint(equalTo: photosImageViewThree.leadingAnchor, constant: -8),
            photosImageViewTwo.widthAnchor.constraint(equalTo: photosImageViewThree.widthAnchor),
            photosImageViewTwo.heightAnchor.constraint(equalToConstant: 75),
            
            photosImageViewThree.leadingAnchor.constraint(equalTo: photosImageViewTwo.trailingAnchor, constant: 8),
            photosImageViewThree.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewThree.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosImageViewThree.trailingAnchor.constraint(equalTo: photosImageViewFour.leadingAnchor, constant: -8),
            photosImageViewThree.widthAnchor.constraint(equalTo: photosImageViewFour.widthAnchor),
            photosImageViewThree.heightAnchor.constraint(equalToConstant: 75),
            
            photosImageViewFour.leadingAnchor.constraint(equalTo: photosImageViewThree.trailingAnchor, constant: 8),
            photosImageViewFour.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewFour.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosImageViewFour.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            photosImageViewFour.widthAnchor.constraint(equalTo: photosImageViewOne.widthAnchor),
            photosImageViewFour.heightAnchor.constraint(equalToConstant: 75),

        ])
        
    }
    
    private func setSubviews() {
        contentView.addSubviews(photosLabel)
        contentView.addSubviews(arrowImageView)
        contentView.addSubviews(photosImageViewOne)
        contentView.addSubviews(photosImageViewTwo)
        contentView.addSubviews(photosImageViewThree)
        contentView.addSubviews(photosImageViewFour)
    }

}
