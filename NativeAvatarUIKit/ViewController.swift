//
//  ViewController.swift
//  NativeAvatarUIKit
//
//  Created by Сергей Прокопьев on 22.05.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var scroll = UIScrollView()
    lazy var imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        title = "Avatar"

        scroll.frame = view.bounds
        scroll.contentSize = .init(width: view.frame.width, height:  view.frame.height * 2)
        view.addSubview(scroll)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.subviews.forEach({ (view) in
                if NSStringFromClass(view.classForCoder).contains("UINavigationBarLargeTitleView") {
                    view.addSubview(imageView)
                    imageView.tintColor = .lightGray
                    imageView.contentMode = .scaleAspectFill
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    view.addConstraints([
                        imageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
                        imageView.widthAnchor.constraint(equalToConstant: 36),
                        imageView.heightAnchor.constraint(equalToConstant: 36)
                    ])
                }
            })
    }
}

