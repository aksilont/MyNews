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
    }
    
    // MARK: - IBActions
    
    @IBAction private func resetDidTap(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
