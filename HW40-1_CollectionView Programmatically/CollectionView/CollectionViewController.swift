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

            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
            configureCollectionView()

        }

        func configureCollectionView () {
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

            collectionView.delegate = self
            collectionView.dataSource = self

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

// CollecitonView's dataSource(資料來源)
extension CollectionViewController: UICollectionViewDataSource {
    // To show how many numberOfItem
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        21
    }

    // dequeue Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            fatalError("Failed to deqeue cell")
        }

        let image = self.images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
}
// CollecitonView's delegate(代理機制)
extension CollectionViewController: UICollectionViewDelegate {

    // didSelectItem in collectionView by using indexPath.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let webVC = WebViewController()
        webVC.url = placesAndUrl[indexPath.row].locationURL
        present(webVC, animated: true)

    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    }

