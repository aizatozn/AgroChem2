//
//  ClientCatalogCell.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 1/2/24.
//

import UIKit
import Combine

final class ClientCatalogCell: BaseTVCell {

    private let catalogNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    private let imageImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.image = UIImage(named: "newsImage1")
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
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    override func onCreate() {
        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubviews(catalogNameLabel, imageImageView, nameLabel,
                    subNameLabel, descriptionLabel)
    }

    private func onSetUpConstraints() {

        catalogNameLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(15)
        }

        imageImageView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(catalogNameLabel.snp.bottom).offset(15)
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
            make.bottom.equalTo(-20)
            make.leading.equalTo(subNameLabel)
            make.trailing.equalTo(-20)
        }
    }

    func configure(model: ClientCatalogModel) {
        catalogNameLabel.text = model.catalogName
        imageImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        subNameLabel.text = model.subName
        descriptionLabel.text = model.description
        if model.catalogName != "" {
            nameLabel.snp.updateConstraints { make in
                make.top.equalTo(50)
                make.leading.equalTo(imageImageView.snp.trailing).offset(30)
                make.trailing.equalTo(-20)
            }
        }
        switch model.catalogName {
        case "Гербициды":
            catalogNameLabel.textColor = .systemRed
//            nameLabel.textColor = .systemRed
        case "Фунгициды":
            catalogNameLabel.textColor = .purple
//            nameLabel.textColor = .purple
        case "Инсектициды":
            catalogNameLabel.textColor = .systemBlue
//            nameLabel.textColor = .systemBlue
        case "Минеральные удобрения":
            catalogNameLabel.textColor = .systemGreen
            nameLabel.textColor = .systemGreen
        case "Протравители семян":
            catalogNameLabel.textColor = .systemPurple
//            nameLabel.textColor = .systemPurple
        case "Десиканты":
            catalogNameLabel.textColor = .orange
//            nameLabel.textColor = .orange
        case "ПАВ":
            catalogNameLabel.textColor = .systemGreen
//            nameLabel.textColor = .systemGreen
        default:
            break
        }
        
//        switch model.name {
//        case "Агроника Гранд":
//            nameLabel.textColor = .systemRed
//        case "Арбалет®":
//            nameLabel.textColor = .systemRed
//        case "Бастер®":
//            nameLabel.textColor = .purple
//        case "Берилл®":
//            nameLabel.textColor = .purple
//        case "Бетаниум®":
//            nameLabel.textColor = .systemBlue
//        case "Бетаниум® 22":
//            nameLabel.textColor = .systemBlue
////            nameLabel.textColor = .systemPurple
//        case "Десиканты":
//            nameLabel.textColor = .orange
////            nameLabel.textColor = .orange
//        case "ПАВ":
//            nameLabel.textColor = .systemGreen
////            nameLabel.textColor = .systemGreen
//        default:
//            break
//        }

    }
}
