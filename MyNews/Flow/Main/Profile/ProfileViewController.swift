//
//  ProfileViewController.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var exitButton: UIButton!
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fillFields()
    }

    // MARK: - Methods
    
    private func setupUI() {
        title = "Профиль"
        
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        emailTextField.layer.cornerRadius = 20
        emailTextField.clipsToBounds = true
        
        passwordTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.clipsToBounds = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(gesture)
    }
    
    private func fillFields() {
        let decoder = JSONDecoder()
        let data = KeychainService.standart.data(forKey: "UserProfile")
        guard let data = data else { return }
        
        if let user = try? decoder.decode(UserProfile.self, from: data) {
            emailTextField.text = user.email
            passwordTextField.text = user.password
        }
    }
    
    @objc private func viewDidTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func exitDidTap(_ sender: UIButton) {
        let handerAlert: () -> () = {
            KeychainService.standart.removeData(forKey: "UserProfile")
            let nextVC = AuthViewController.getFromXIB()
            Coordinator.shared.goTo(nextVC)
        }
        self.showAlertExit(title: "Выход", message: "Вы уверены что хотите выйти из аккаунта", handler: handerAlert)
    }
    
    @IBAction func passwordEditingDidBegan(_ sender: UITextField) {
        sender.isSecureTextEntry = false
    }
    
    @IBAction func passwordEditingDidEnd(_ sender: UITextField) {
        sender.isSecureTextEntry = true
    }
}
