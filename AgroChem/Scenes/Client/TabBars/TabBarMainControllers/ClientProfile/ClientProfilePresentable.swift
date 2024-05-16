//
//  ClientProfilePresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientProfilePresentable: BaseView {

    let clientProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 100)
        label.textColor = UIColor.red
        return label
    }()

    let clientProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap counter", for: .normal)
        button.setTitleColor(UIColor(red: 0/255, green: 153/255, blue: 51/255, alpha: 1.0), for: .normal)
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next controller", for: .normal)
        button.setTitleColor(UIColor(red: 0/255, green: 153/255, blue: 51/255, alpha: 1.0), for: .normal)
        return button
    }()

    // Создаем градиентный слой
//    let gradientLayer: CAGradientLayer = {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor(red: 0/255, green: 153/255, blue: 51/255, alpha: 1.0).cgColor,
//            UIColor.white.cgColor
//        ]
//        return gradientLayer
//    }()

    override func onConfigureView() {
        super.onConfigureView()
//        layer.insertSublayer(gradientLayer, at: 0)
        backgroundColor = .white
    }

    override func onAddSubviews() {
        addSubviews(clientProfileLabel, clientProfileButton, nextButton)
    }

    override func onSetupConstraints() {
        clientProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }

        clientProfileButton.snp.makeConstraints { make in
            make.top.equalTo(clientProfileLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(clientProfileButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        gradientLayer.frame = bounds
    }
}
