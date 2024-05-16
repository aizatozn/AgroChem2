//
//  ClientSecondDirectoryDetailsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/4/24.
//

import UIKit
import SnapKit

final class ClientSecondDirectoryDetailsCell: BaseCVCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()

    private let nameInEnglishLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 5
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 15
        return label
    }()

    override func onCreate() {
        layer.cornerRadius = 10
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false

        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubviews(nameLabel, nameInEnglishLabel, contentLabel, descriptionLabel)
    }

    private func onSetUpConstraints() {

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        nameInEnglishLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(nameInEnglishLabel.snp.bottom).offset(3)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(12)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
            make.bottom.equalTo(-15)
        }
    }

    func configure(model: ClientSecondDirectoryModel) {
        nameLabel.text = model.name
        nameInEnglishLabel.text = model.nameInEnglish
        contentLabel.text = model.content // Use the new 'content' property
        descriptionLabel.text = model.description
    }
}
