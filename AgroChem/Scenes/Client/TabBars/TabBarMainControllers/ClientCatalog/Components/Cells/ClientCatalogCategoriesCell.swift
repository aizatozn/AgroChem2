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

        setColorForCatalogName(catalogName: model.catalogName)
        setColorForName(name: model.name)
    }

    private func setColorForCatalogName(catalogName: String) {
        switch catalogName {
        case "Гербициды":
            catalogNameLabel.textColor = .systemRed
        case "Фунгициды":
            catalogNameLabel.textColor = .purple
        case "Инсектициды":
            catalogNameLabel.textColor = .systemBlue
        case "Минеральные удобрения":
            catalogNameLabel.textColor = .systemGreen
            nameLabel.textColor = .systemGreen
        case "Протравители семян":
            catalogNameLabel.textColor = .systemPurple
        case "Десиканты":
            catalogNameLabel.textColor = .orange
        case "ПАВ":
            catalogNameLabel.textColor = .systemGreen
        default:
            break
        }
    }

    private func setColorForName(name: String) {
        let redNames: Set = [
            "Агроника Гранд", "Арбалет®", "Бастер®", "Берилл®", "Бетаниум®", "Бетаниум® 22", "Гарнизон®", "Гербикс",
            "Глифор®", "Глифор® Форте", "Гран-при", "Дентайр®", "Канон", "Клерк", "Маркос®", "Мегалит®", "Монолит®",
            "Октапон Экстра", "Олимп", "Рапира®", "Рефери", "Сапфир®", "Тайгер", "Тайгер 100", "Тристар®", "Фирман",
            "Цицерон®", "Челленджер®"
        ]
        let purpleNames: Set = [
            "Азоксит®", "Армадекс®", "Бульдог®", "Гранберг®", "Гранберг® Про", "Курсор", "Кэнсел®", "Ципрос", "Эпоксин®"
        ]
        let blueNames: Set = [
            "Аккорд®", "Восторг", "Дитокс®", "Калаш®", "Лассо®", "Норил"
        ]
        let greenNames: Set = [
            "АгроМинерал® Зерновые", "АгроМинерал® Олеистые", "АгроМинерал® Стручковые и Бобовые"
        ]
        let sysPurpleNames: Set = [
            "Виталон", "Грандсил®", "Грандсил® Ультра", "Грифон®", "Пионер", "Сабля", "Стрит®"
        ]

        if redNames.contains(name) {
            nameLabel.textColor = .systemRed
        } else if purpleNames.contains(name) {
            nameLabel.textColor = .purple
        } else if blueNames.contains(name) {
            nameLabel.textColor = .systemBlue
        } else if greenNames.contains(name) {
            nameLabel.textColor = .systemGreen
        } else if sysPurpleNames.contains(name) {
            nameLabel.textColor = .systemPurple
        }
    }

}
