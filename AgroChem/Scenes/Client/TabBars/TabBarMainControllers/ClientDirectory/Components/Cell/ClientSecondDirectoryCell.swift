//
//  ClientSecondDirectoryCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 25/4/24.
//

import Foundation
import UIKit

final class ClientSecondDirectoryCell: BaseCVCell {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let englishTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0) // Ярко-серый цвет
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0 // Разрешаем многострочный текст
        return label
    }()

    private let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0 // Разрешаем многострочный текст
        return label
    }()

    override func onCreate() {
        layer.cornerRadius = 10
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowOpacity = 0.3

        onAddSubviews()
        onSetupConstraints()
    }

    private func onAddSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(englishTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(additionalInfoLabel)
    }

    private func onSetupConstraints() {

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }

        englishTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(englishTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }

        additionalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
    }

    func configure(title: String, englishTitle: String, description: String, additionalInfo: String) {
        titleLabel.text = title
        englishTitleLabel.text = englishTitle
        descriptionLabel.text = description
        additionalInfoLabel.text = additionalInfo
    }
}
