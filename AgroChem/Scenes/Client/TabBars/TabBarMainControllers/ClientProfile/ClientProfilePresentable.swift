//
//  ClientProfilePresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientProfilePresentable: BaseView {
    
    let userDef = UserDefaultsServiceImpl()

    let userEmailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.textColor = UIColor.red
        return label
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitle("Log Out", for: .normal)
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
        userEmailLabel.text = "Your email: \(userDef.getString(.userEmail) ?? "")"
    }

    override func onAddSubviews() {
        addSubviews(userEmailLabel, nextButton)
    }

    override func onSetupConstraints() {
        userEmailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        gradientLayer.frame = bounds
    }
}
