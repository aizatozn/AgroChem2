//
//  ClientCatalogCell.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 1/2/24.
//

import UIKit
import Combine

final class ClientCatalogCell: BaseTVCell {

    private let imageImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.image = UIImage(named: "newsImage1")
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Agronika Grand, MD"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    private let subNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Agronika Grand, MD, Agronika Grand, MD, Agronika Grand, MD"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agronika Grand, MD, Agronika Grand, MD, Agronika Grand, MD" +
                     "gronika Grand, MD, Agronika Grand, MD, Agronika Grand, MD,," +
        "Agronika Grand, MD, Agronika Grand, MD, Agronika Grand, MD" +
                     "gronika Grand, MD, Agronika Grand, MD, Agronika Grand, MD,,"
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 5
        return label
    }()

    override func onCreate() {
        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubviews(imageImageView, nameLabel, subNameLabel, descriptionLabel)
    }

    private func onSetUpConstraints() {

        imageImageView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(15)
            make.width.height.equalTo(80)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(imageImageView.snp.trailing).offset(30)
            make.trailing.equalTo(-20)
        }

        subNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(-20)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(subNameLabel.snp.bottom).offset(6)
            make.bottom.equalTo(-6)
            make.leading.equalTo(subNameLabel)
            make.trailing.equalTo(-20)
        }
    }

    func configure(model: ClientCatalogModel) {
        imageImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        subNameLabel.text = model.subName
        descriptionLabel.text = model.description
    }
}
