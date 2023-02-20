//
//  ResetPasswordViewController.swift
//  MyNews
//
//  Created by Aksilont on 14.02.2023.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        title = "Сброс пароля"
        navigationItem.largeTitleDisplayMode = .never
        
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        emailTextField.layer.cornerRadius = 20
        emailTextField.clipsToBounds = true
        
        resetButton.layer.cornerRadius = 20
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func viewDidTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction private func resetDidTap(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty
        else {
            showAlertOk(title: "Ошибка", message: "Запоните пустые поля")
            return
        }
        guard Validators.isSimpleEmail(email) else {
            showAlertOk(title: "Ошибка", message: "Указан некорректный email")
            return
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
