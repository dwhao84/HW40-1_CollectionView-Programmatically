//
//  CollectionViewCell.swift
//  HW40-1_CollectionView Programmatically
//
//  Created by Dawei Hao on 2023/12/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "pic01")
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    func configureImageView () {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

}
