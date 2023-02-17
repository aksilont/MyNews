//
//  AuthViewController.swift
//  MyNews
//
//  Created by Aksilont on 14.02.2023.
//

import UIKit

class AuthViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        title = "Вход"
        navigationItem.backButtonTitle = ""
        
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        emailTextField.layer.cornerRadius = 20
        emailTextField.clipsToBounds = true
        
        passwordTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clipsToBounds = true
        
        enterButton.layer.cornerRadius = 20
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func viewDidTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction private func enterDidTap(_ sender: UIButton) {
        //TODO: Вход в приложение
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MainTabBarController")
        Coordinator.shared.goTo(nextVC, useNavigationController: false)
    }
    
    @IBAction private func registerDidTap(_ sender: UIButton) {
        let nextVC = RegisterViewController(
            nibName: String(describing: RegisterViewController.self),
            bundle: nil)
        Coordinator.shared.goTo(nextVC)
    }
    
    @IBAction private func resetPasswordDidTap(_ sender: UIButton) {
        let nextVC = ResetPasswordViewController(
            nibName: String(describing: ResetPasswordViewController.self),
            bundle: nil)
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
