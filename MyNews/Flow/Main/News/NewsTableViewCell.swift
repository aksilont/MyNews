//
//  NewsTableViewCell.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
    }
    
    // MARK: - Methods
    
    func configure(news: News) {
        mainImageView.image = news.image
        dateLabel.text = news.date.simpleFormat()
        titleLabel.text = news.title
        likeButton.liked = news.liked
        descriptionLabel.text = news.textNews
    }
    
}
