//
//  ClientHelpAndSupportPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import UIKit
import SnapKit

final class ClientHelpAndSupportPresentable: BaseView {

    var telegramButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Telegram", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.masksToBounds = true
        return button
    }()

    override func onConfigureView() {
        backgroundColor = .white
    }

    override func onAddSubviews() {
        addSubviews(telegramButton)
    }

    override func onSetupConstraints() {

        telegramButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
    }
}
