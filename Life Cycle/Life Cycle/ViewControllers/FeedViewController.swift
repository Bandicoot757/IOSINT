//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
    }
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Not implemented now"
        return label
    }()
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        view.addSubviews(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

    }
    
}
