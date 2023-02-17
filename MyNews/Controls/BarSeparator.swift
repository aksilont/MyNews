//
//  BarSeparator.swift
//  MyNews
//
//  Created by Aksilont on 17.02.2023.
//

import UIKit

class BarSeparator: UIView {
    
    let height: CGFloat = 1

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func layoutConstraints(for navigationBar: UINavigationBar) -> [NSLayoutConstraint] {
        [
            widthAnchor.constraint(equalTo: navigationBar.widthAnchor),
            heightAnchor.constraint(equalToConstant: CGFloat(height)),
            centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
        ]
    }
    
    func layoutConstraints(for tabBar: UITabBar) -> [NSLayoutConstraint] {
        [
            widthAnchor.constraint(equalTo: tabBar.widthAnchor),
            heightAnchor.constraint(equalToConstant: CGFloat(height)),
            centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            topAnchor.constraint(equalTo: tabBar.topAnchor),
        ]
    }
    
}
