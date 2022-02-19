//
//  UIViewController+Ext.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//


import UIKit

extension UIViewController {
    func alert(message: String, title: String = "", buttonMessage: String? = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: buttonMessage, style: .default, handler: nil)
        alertController.addAction(OKAction)
        if viewIfLoaded?.window != nil {
            present(alertController, animated: true, completion: nil)
        }
    }
}
