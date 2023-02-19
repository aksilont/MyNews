//
//  UIViewController+Alert.swift
//  MyNews
//
//  Created by Aksilont on 19.02.2023.
//

import UIKit

extension UIViewController {
    
    func showAlertOk(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func showAlertExit(title: String, message: String, handler: @escaping () -> ()) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let actionCacel = UIAlertAction(title: "Отмена", style: .cancel)
        let actionExit = UIAlertAction(title: "Выход", style: .destructive) { _ in
            handler()
        }
        alert.addAction(actionCacel)
        alert.addAction(actionExit)

        self.present(alert, animated: true)
    }
    
}
