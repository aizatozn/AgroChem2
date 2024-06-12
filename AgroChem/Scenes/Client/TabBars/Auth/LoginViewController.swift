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
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 5
        return button
    }()

    private let appLogoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo")) // замените "appLogo" на имя вашего логотипа
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()

    private let image3ImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "picture"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Войдите с помощью аккаунта Google, чтобы оставаться на связи с нами"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private var loginObserver: NSObjectProtocol?

    private func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ок", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }

    private func alreadyHaveAccountAlert(with error: String) {
        let alert = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ок", style: .default)
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

        title = ""
        view.backgroundColor = .systemBackground

        setupSubviews()
        configureConstraints()
    }

    deinit {
        if let observer = loginObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    private func setupSubviews() {
        view.addSubview(appLogoImageView)
        view.addSubview(image3ImageView)
        view.addSubview(titleLabel)
        view.addSubview(googleLogInButton)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            appLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            appLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLogoImageView.widthAnchor.constraint(equalToConstant: 120),
            
            image3ImageView.topAnchor.constraint(equalTo: appLogoImageView.bottomAnchor, constant: 1),
            image3ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image3ImageView.widthAnchor.constraint(equalToConstant: 250),
            
            googleLogInButton.topAnchor.constraint(equalTo: image3ImageView.bottomAnchor, constant: 1),
            googleLogInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleLogInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: googleLogInButton.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}


