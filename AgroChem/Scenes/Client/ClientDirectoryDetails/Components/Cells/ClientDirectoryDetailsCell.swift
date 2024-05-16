//
//  ClientDirectoryDetailsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import SnapKit

final class ClientDirectoryDetailsCell: BaseCVCell {

    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    private let nameInEnglishLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 19, weight: .regular)
        return label
    }()

    override func onCreate() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor

        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubviews(photoImageView, nameInEnglishLabel, nameLabel)
    }

    private func onSetUpConstraints() {

        photoImageView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }

        nameInEnglishLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-12)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(nameInEnglishLabel.snp.top).offset(-6)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }
    }

    func configure(model: ClientDirectoryModel) {
        photoImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        nameInEnglishLabel.text = model.nameInEnglish
    }
}
