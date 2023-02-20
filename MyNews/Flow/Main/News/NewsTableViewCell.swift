//
//  NewsTableViewCell.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

protocol NewsCellChangeDelegate: AnyObject {
    func changeCell(index: UUID)
}

class NewsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var delegate: NewsCellChangeDelegate?
    private var currentIndex: UUID?
    
    // MARK: - Lyfe Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.cornerRadius = 22
        mainView.layer.cornerCurve = .continuous
        mainView.layer.masksToBounds = true
        
        backView.layer.cornerRadius = 22
        backView.layer.cornerCurve = .continuous
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowRadius = 3
        backView.layer.shadowOpacity = 0.05
        backView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        likeButton.addTarget(self, action: #selector(likedDidTap), for: .touchUpInside)
    }
    
    @objc private func likedDidTap(_ sender: UIButton) {
        guard let delegate = delegate, let currentIndex = currentIndex else { return }
        delegate.changeCell(index: currentIndex)
    }
    
    // MARK: - Methods
    
    func configure(item: News) {
        currentIndex = item.id
        mainImageView.image = item.image
        dateLabel.text = item.date.simpleFormat()
        titleLabel.text = item.title
        likeButton.liked = item.liked
        descriptionLabel.text = item.textNews
    }
    
}
