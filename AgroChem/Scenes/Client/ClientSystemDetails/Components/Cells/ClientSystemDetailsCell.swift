//
//  ClientSystemDetailsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 27/4/24.
//

import UIKit
import SnapKit

final class ClientSystemDetailsCell: BaseTVCell {

    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    override func onCreate() {
        onAddSubviews()
        onSetUpConstraints()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    private func onAddSubviews() {
        addSubviews(nameLabel, iconImageView)
    }

    private func onSetUpConstraints() {

        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
            make.width.height.equalTo(50)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(15)
            make.trailing.equalTo(-12)
        }
    }

    func configure(model: ClientSystemCategoryModel) {
        iconImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        nameLabel.textColor = model.color
//        iconImageView.tintColor = model.color
    }
}
