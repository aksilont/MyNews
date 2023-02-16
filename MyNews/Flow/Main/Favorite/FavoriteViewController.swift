//
//  FavoriteViewController.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    private let news: [News] = News.mockData()
    private var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    
    // MARK: - Methods
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
                
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}


extension FavoriteViewController: UICollectionViewDelegate {
}

extension FavoriteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as? FavoriteCollectionViewCell else {
            fatalError("Wrong cell")
        }
        cell.update(news: news[indexPath.row])
        return cell
    }
    
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 15 * 2 - 18) / 2
        return CGSize(width: width, height: width * 1.2)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 24, bottom: 5, right: 24)
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}
