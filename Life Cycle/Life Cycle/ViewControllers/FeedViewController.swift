//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

final class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editImage()
        view.backgroundColor = .white
    }
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.text = "Feed page is not implemented now"
        return label
    }()
    
    private lazy var pictureView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    
    func editImage() {
        let processor = ImageProcessor()
        processor.processImage(sourceImage: UIImage(named: "City") ?? UIImage(), filter: .crystallize(radius: 3), completion: { image in
            imageView.image = image
        })
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        view.addSubviews(label)
        view.addSubviews(pictureView)
        pictureView.addSubviews(imageView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        label.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea)
            make.left.equalTo(safeArea)
            make.right.equalTo(safeArea)
        }
        
        pictureView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea).offset(100)
            make.left.equalTo(safeArea)
            make.right.equalTo(safeArea)
            make.centerX.equalTo(safeArea)
        }

        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(pictureView)
            make.left.equalTo(pictureView)
            make.right.equalTo(pictureView)
            make.centerX.equalTo(pictureView)
        }
        
    }
}
