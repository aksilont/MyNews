//
//  DetailNewsViewController.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

class DetailNewsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textNews: UILabel!
    
    // MARK: - Properties
    
    var currentNews: News?
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        title = "Статья"
        
        guard let currentNews = currentNews else { return }
               
        imageView.image = currentNews.image
        dateLabel.text = currentNews.date.simpleFormat()
        likeButton.liked = currentNews.liked
        titleLabel.text = currentNews.title
        textNews.text = currentNews.textNews
        
        imageView.layer.cornerRadius = 22
        imageView.layer.cornerCurve = .continuous
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

}
