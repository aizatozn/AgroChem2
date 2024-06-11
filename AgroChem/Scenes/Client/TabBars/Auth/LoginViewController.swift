//
//  LoginViewController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 11/6/24.
//

import UIKit
import Combine
import FirebaseAuth
import GoogleSignIn
import FirebaseFirestore

final class LoginViewController: UIViewController {

    private var subscriptions: Set<AnyCancellable> = []

    private let googleLogInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var loginObserver: NSObjectProtocol?

    private func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }

    private func alreadyHaveAccountAlert(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginObserver = NotificationCenter.default.addObserver(
            forName: .didLogInNotification,
            object: nil,
            queue: .main,
            using: { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.navigationController?.dismiss(animated: true)
            })
        GIDSignIn.sharedInstance()?.presentingViewController = self

        title = "Log In"
        view.backgroundColor = .systemBackground

        view.addSubview(googleLogInButton)
        configureConstraints()
    }

    deinit {
        if let observer = loginObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    private func configureConstraints() {

        let googleLogInButtonConstraints = [
            googleLogInButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            googleLogInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            googleLogInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]

        NSLayoutConstraint.activate(googleLogInButtonConstraints)
    }
}
