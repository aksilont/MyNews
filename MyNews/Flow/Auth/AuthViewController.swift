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
    
    // MARK: - Properties
    
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
            self.showAlertOk(title: "Ошибка", message: "Запоните пустые поля")
            return
        }
        
        authService.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                if let userData = try? user.getData() {
                    KeychainService.standart.set(userData, forKey: "UserProfile")
                }
                let nextVC = UIViewController.getFromStoryboard(withIdentifier: "MainTabBarController")
                Coordinator.shared.goTo(nextVC, useNavigationController: false)
            case .failure(_):
                self?.showAlertOk(title: "Ошибка", message: "Указан неправильный логин или папроль")
            }
        }
    }
    
    @IBAction private func registerDidTap(_ sender: UIButton) {
        let nextVC = RegisterViewController.getFromXIB()
        nextVC.navigationItem.hidesBackButton = true
        nextVC.authService = FirebaseAuthService()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction private func resetPasswordDidTap(_ sender: UIButton) {
        let nextVC = ResetPasswordViewController.getFromXIB()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
