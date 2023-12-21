//
//  CollectionViewController.swift
//  HW40-1_CollectionView Programmatically
//
//  Created by Dawei Hao on 2023/12/21.
//

import UIKit

class CollectionViewController: UIViewController {

        private var images: [UIImage] = []

        private  let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical

            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .systemBackground
            collectionView.alwaysBounceVertical = true
            return collectionView
        }()

        override func viewDidLoad() {
            super.viewDidLoad()

            for _ in 0...20 {
                images.append(UIImage(named: "pic01")!)
                images.append(UIImage(named: "pic02")!)
                images.append(UIImage(named: "pic03")!)
                images.append(UIImage(named: "pic04")!)
                images.append(UIImage(named: "pic05")!)
                images.append(UIImage(named: "pic06")!)
                images.append(UIImage(named: "pic07")!)
                images.append(UIImage(named: "pic08")!)
                images.append(UIImage(named: "pic09")!)
                images.append(UIImage(named: "pic10")!)
                images.append(UIImage(named: "pic11")!)
                images.append(UIImage(named: "pic12")!)
                images.append(UIImage(named: "pic13")!)
                images.append(UIImage(named: "pic14")!)
                images.append(UIImage(named: "pic15")!)
                images.append(UIImage(named: "pic16")!)
                images.append(UIImage(named: "pic17")!)
                images.append(UIImage(named: "pic18")!)
                images.append(UIImage(named: "pic19")!)
                images.append(UIImage(named: "pic20")!)
                images.append(UIImage(named: "pic21")!)
            }

            configureCollectionView()

        }

        func configureCollectionView () {
            view.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }


}


