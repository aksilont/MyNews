//
//  SceneDelegate.swift
//  MyNews
//
//  Created by Aksilont on 14.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let nextVC = AuthViewController(
            nibName: String(describing: AuthViewController.self),
            bundle: nil)
        nextVC.authService = SimpleAuthService()
        let navigationVC = UINavigationController(rootViewController: nextVC)
        navigationVC.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
        self.window = window
    }
}
