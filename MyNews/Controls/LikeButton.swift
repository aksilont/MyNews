//
//  LikeButton.swift
//  MyNews
//
//  Created by Aksilont on 16.02.2023.
//

import UIKit

class LikeButton: UIButton {
    
    // MARK: - Properties
    
    var liked = false {
        didSet {
            if liked {
                setImage(UIImage(named: "LikeFill"), for: .normal)
            } else {
                setImage(UIImage(named: "Like"), for: .normal)
            }
        }
    }
    
    var likeAction: ((Bool) -> ())?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Methods
    
    private func setup() {
        addTarget(self, action: #selector(doLike), for: .touchUpInside)
    }
    
    @objc private func doLike(_ sender: UIButton) {
        liked.toggle()
        
        guard let likeAction = likeAction else { return }
        likeAction(liked)
    }
}
