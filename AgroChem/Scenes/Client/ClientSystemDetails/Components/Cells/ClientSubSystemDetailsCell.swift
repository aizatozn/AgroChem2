//
//  ClientSubSystemDetailsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 5/5/24.
//

import UIKit
import Combine
import SnapKit

final class ClientSubSystemDetailsCell: BaseTVCell {

    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    private let subNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let fazaLabel: UILabel = {
        let label = UILabel()
        label.text = "Фаза культуры"
        label.textColor = .systemRed
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let subFazaLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let normaLabel: UILabel = {
        let label = UILabel()
        label.text = "Норма расхода"
        label.textColor = .systemRed
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let subNormaLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    override func onCreate() {
        onAddSubviews()
        onSetUpConstraints()
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.black.cgColor
    }

    private func onAddSubviews() {
        addSubviews(nameLabel, iconImageView, subNameLabel, fazaLabel, subFazaLabel, normaLabel, subNormaLabel)
    }

    private func onSetUpConstraints() {

        iconImageView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(15)
            make.width.height.equalTo(100)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(iconImageView.snp.trailing).offset(30)
            make.trailing.equalTo(-20)
        }

        subNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(-20)
        }

        fazaLabel.snp.makeConstraints { make in
            make.top.equalTo(subNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(-20)
        }

        subFazaLabel.snp.makeConstraints { make in
            make.top.equalTo(fazaLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(-20)
        }

        normaLabel.snp.makeConstraints { make in
            make.top.equalTo(subFazaLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(-20)
        }

        subNormaLabel.snp.makeConstraints { make in
            make.top.equalTo(normaLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(-10)
        }
    }

    func configure(model: ClientCategoryDetailsModel) {
        iconImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        subNameLabel.text = model.subName
        subFazaLabel.text = model.subFaza
        subNormaLabel.text = model.subNorma
        normaLabel.textColor = model.color
        fazaLabel.textColor = model.color
        nameLabel.textColor = model.color
    }
}
