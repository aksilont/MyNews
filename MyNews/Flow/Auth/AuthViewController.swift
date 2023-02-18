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
    
    var authService: AuthServiceProtocol = SimpleAuthService()
    
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
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            let alert = UIAlertController(title: "Ошибка",
                                          message: "Запоните пустые поля",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        if authService.check(email: email, password: password) {
            let nextVC = UIViewController.getFromStoryboard(withIdentifier: "MainTabBarController")
            Coordinator.shared.goTo(nextVC, useNavigationController: false)
        } else {
            let alert = UIAlertController(title: "Ошибка",
                                          message: "Указан неправильный логин или папроль",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    @IBAction private func registerDidTap(_ sender: UIButton) {
        let nextVC = RegisterViewController.getFromXIB()
        nextVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction private func resetPasswordDidTap(_ sender: UIButton) {
        let nextVC = ResetPasswordViewController.getFromXIB()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
