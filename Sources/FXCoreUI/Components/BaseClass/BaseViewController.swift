//
//  BaseViewController.swift
//
//
//  Created by Ansyar Hafid on 06/02/24.
//

import UIKit

open class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarTitleImage()
        // configureNavigationBarShadow()
    }
    
    private func configureNavigationBarTitleImage() {
        let logo = UIImage(named: "img_logo")
        let imageView = UIImageView(image: logo)
        //imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleView = UIView()
        titleView.addSubview(imageView)
        navigationItem.titleView = titleView
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor)
        ])
        titleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureNavigationBarShadow() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowOpacity = 0.1
        navigationController?.navigationBar.layer.shadowRadius = 4.0
    }
}
