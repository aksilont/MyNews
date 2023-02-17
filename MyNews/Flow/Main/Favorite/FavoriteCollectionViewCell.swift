//
//  FavoriteCollectionViewCell.swift
//  MyNews
//
//  Created by Aksilont on 16.02.2023.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let likeButton: LikeButton = {
        let button = LikeButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 22
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true
        
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(likeButton)
        
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        let safeArea = contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            imageView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 6),
            stackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -6),
            
            titleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 6),
            titleLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -6),
        ])
    }
    
    func update(news: News) {
        imageView.image = news.image
        dateLabel.text = news.date.simpleFormat()
        likeButton.liked = news.liked
        titleLabel.text = news.title
    }
    
}
