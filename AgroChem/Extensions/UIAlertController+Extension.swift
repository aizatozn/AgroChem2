//
//  UIAlertController+Extension.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit

extension UIAlertController {

    convenience init(title: String?, message: String?, font: UIFont) {
        self.init(title: title, message: message, preferredStyle: .alert)

        let attributedMessage = NSMutableAttributedString(
            string: message ?? "",
            attributes: [NSAttributedString.Key.font: font]
        )
        self.setValue(attributedMessage, forKey: "attributedMessage")
    }

    static func showAlert(
        title: String,
        message: String,
        actionTitle: String,
        presentingViewController: UIViewController
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            font: .systemFont(ofSize: 14, weight: .regular)
        )

        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        presentingViewController.present(alert, animated: true, completion: nil)
    }
}
