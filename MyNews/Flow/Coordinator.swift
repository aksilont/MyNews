//
//  Coordinator.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

final class Coordinator {
    static let shared = Coordinator()
    
    private init() {}
    
    func goTo(_ to: UIViewController, useNavigationController: Bool = true) {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        if useNavigationController {
            let navigationVC = UINavigationController(rootViewController: to)
            navigationVC.navigationBar.prefersLargeTitles = true
            sceneDelegate?.window?.rootViewController = navigationVC
        } else {
            sceneDelegate?.window?.rootViewController = to
        }
        
    }
}
