//
//  ClientGreetingPresentable.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import SnapKit

final class GreetingPresentable: BaseView {

    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 100)
        label.textColor = UIColor.red
        return label
    }()

    let greetingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap counter", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next controller", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()

    override func onConfigureView() {
        backgroundColor = .yellow
    }

    override func onAddSubviews() {
        addSubviews(greetingLabel, greetingButton, nextButton)
    }

    override func onSetupConstraints() {

        greetingLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }

        greetingButton.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(greetingButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
