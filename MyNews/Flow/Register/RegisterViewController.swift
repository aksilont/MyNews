//
//  RegisterViewController.swift
//  MyNews
//
//  Created by Aksilont on 14.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        title = "Регистрация"
        
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        emailTextField.layer.cornerRadius = 20
        emailTextField.clipsToBounds = true
        
        passwordTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clipsToBounds = true
        
        enterButton.layer.cornerRadius = 20
    }
    
    // MARK: - IBActions
    
    @IBAction private func enterDidTap(_ sender: UIButton) {
        //TODO: Вход в приложение с новым логином
    }
    
    @IBAction private func loginDidTap(_ sender: UIButton) {
        let nextVC = AuthViewController(
            nibName: String(describing: AuthViewController.self),
            bundle: nil)
        
        Coordinator.shared.goTo(nextVC)
    }
    
}
