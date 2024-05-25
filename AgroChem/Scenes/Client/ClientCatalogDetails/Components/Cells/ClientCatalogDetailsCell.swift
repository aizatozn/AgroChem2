//
//  ClientCatalogDetailsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 16/5/24.
//

import UIKit
import SnapKit
// swiftlint:disable type_body_length
final class ClientCatalogDetailsCell: BaseCVCell {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let upaLabel: UILabel = {
        let label = UILabel()
        label.text = "Упаковано"
        label.textColor = .systemRed
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    private let upaTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let normaLabel: UILabel = {
        let label = UILabel()
        label.text = "Норма расхода"
        label.textColor = .systemRed
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label

    }()

    private let normaTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let obraLabel: UILabel = {
        let label = UILabel()
        label.text = "Стоимость обработки"
        label.textColor = .systemRed
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    private let obraTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let formLabel: UILabel = {
        let label = UILabel()
        label.text = "Препаративная форма"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    private let formTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let deistLabel: UILabel = {
        let label = UILabel()
        label.text = "Действующие вещества"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    private let deistTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private let opiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let preLabel: UILabel = {
        let label = UILabel()
        label.text = "Преимущества"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let preTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let mehLabel: UILabel = {
        let label = UILabel()
        label.text = "Механизм действия"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let mehTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let skoLabel: UILabel = {
        let label = UILabel()
        label.text = "Скорость воздействия"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let skoTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let periLabel: UILabel = {
        let label = UILabel()
        label.text = "Период защщитного действия"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let periTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let spekLabel: UILabel = {
        let label = UILabel()
        label.text = "Спектр действия"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let spekTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let vozLabel: UILabel = {
        let label = UILabel()
        label.text = "Возникновение резистентности"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let vozTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let fitLabel: UILabel = {
        let label = UILabel()
        label.text = "Фитотоксичность и толерантность"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let fitTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let sovLabel: UILabel = {
        let label = UILabel()
        label.text = "Совместимость"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let sovTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let predLabel: UILabel = {
        let label = UILabel()
        label.text = "Предостережения"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let predTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    override func onCreate() {
        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubviews(imageView, descriptionLabel, priceLabel, upaLabel)
        addSubviews(upaTextLabel, normaLabel, normaTextLabel, obraLabel)
        addSubviews(obraTextLabel, formLabel, formTextLabel, deistLabel)
        addSubviews(deistTextLabel, opiLabel, preLabel, preTextLabel)
        addSubviews(mehLabel, mehTextLabel, skoLabel, skoTextLabel)
        addSubviews(periLabel, periTextLabel, spekLabel, spekTextLabel)
        addSubviews(vozLabel, vozTextLabel, fitLabel, fitTextLabel)
        addSubviews(sovLabel, sovTextLabel, predLabel, predTextLabel)
    }
    // swiftlint:disable function_body_length
    private func onSetUpConstraints() {

        imageView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(1)
            make.width.height.equalTo(250)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }

        upaLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview().offset(-40) // Отступ влево от центра на 5 единиц
        }

        upaTextLabel.snp.makeConstraints { make in
            make.top.equalTo(upaLabel)
            make.leading.equalTo(upaLabel.snp.trailing).offset(10) // Отступ вправо от upaLabel на 10 единиц
        }

        normaLabel.snp.makeConstraints { make in
            make.top.equalTo(upaLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview().offset(-55) // Отступ влево от центра на 5 единиц
        }

        normaTextLabel.snp.makeConstraints { make in
            make.top.equalTo(normaLabel)
            make.leading.equalTo(normaLabel.snp.trailing).offset(10) // Отступ вправо от upaLabel на 10 единиц
        }

        obraLabel.snp.makeConstraints { make in
            make.top.equalTo(normaLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview().offset(-75) // Отступ влево от центра на 5 единиц
        }

        obraTextLabel.snp.makeConstraints { make in
            make.top.equalTo(obraLabel)
            make.leading.equalTo(obraLabel.snp.trailing).offset(10) // Отступ вправо от upaLabel на 10 единиц
        }

        formLabel.snp.makeConstraints { make in
            make.top.equalTo(obraLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview().offset(-75) // Отступ влево от центра на 5 единиц
        }

        formTextLabel.snp.makeConstraints { make in
            make.top.equalTo(formLabel)
            make.leading.equalTo(formLabel.snp.trailing).offset(10) // Отступ вправо от upaLabel на 10 единиц
        }

        deistLabel.snp.makeConstraints { make in
            make.top.equalTo(formLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview().offset(-80) // Отступ влево от центра на 5 единиц
        }

        deistTextLabel.snp.makeConstraints { make in
            make.top.equalTo(deistLabel)
            make.leading.equalTo(deistLabel.snp.trailing).offset(10) // Отступ вправо от upaLabel на 10 единиц
        }

        opiLabel.snp.makeConstraints { make in
            make.top.equalTo(deistTextLabel.snp.bottom).offset(40)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }

        preLabel.snp.makeConstraints { make in
            make.top.equalTo(opiLabel.snp.bottom).offset(20)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        preTextLabel.snp.makeConstraints { make in
            make.top.equalTo(preLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        mehLabel.snp.makeConstraints { make in
            make.top.equalTo(preTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        mehTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mehLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        skoLabel.snp.makeConstraints { make in
            make.top.equalTo(mehTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        skoTextLabel.snp.makeConstraints { make in
            make.top.equalTo(skoLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        periLabel.snp.makeConstraints { make in
            make.top.equalTo(skoTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        periTextLabel.snp.makeConstraints { make in
            make.top.equalTo(periLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        spekLabel.snp.makeConstraints { make in
            make.top.equalTo(periTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        spekTextLabel.snp.makeConstraints { make in
            make.top.equalTo(spekLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        vozLabel.snp.makeConstraints { make in
            make.top.equalTo(spekTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        vozTextLabel.snp.makeConstraints { make in
            make.top.equalTo(vozLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        fitLabel.snp.makeConstraints { make in
            make.top.equalTo(vozTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        fitTextLabel.snp.makeConstraints { make in
            make.top.equalTo(fitLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        sovLabel.snp.makeConstraints { make in
            make.top.equalTo(fitTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        sovTextLabel.snp.makeConstraints { make in
            make.top.equalTo(sovLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        predLabel.snp.makeConstraints { make in
            make.top.equalTo(sovTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        predTextLabel.snp.makeConstraints { make in
            make.top.equalTo(predLabel.snp.bottom).offset(15)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }
    }
    // swiftlint:enable function_body_length
    func configure(model: ClientCatalogDetailsModel, name: String) {
        imageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        priceLabel.text = model.price
        upaTextLabel.text = model.upaText
        normaTextLabel.text = model.normaText
        obraTextLabel.text = model.obraText
        formTextLabel.text = model.formText
        deistTextLabel.text = model.deistText
        opiLabel.text = model.opi
        preLabel.text = model.pre
        preTextLabel.text = model.preText
        mehLabel.text = model.meh
        mehTextLabel.text = model.mehText
        skoLabel.text = model.sko
        skoTextLabel.text = model.skoText
        periLabel.text = model.peri
        periTextLabel.text = model.periText
        spekLabel.text = model.spek
        spekTextLabel.text = model.spekText
        vozLabel.text = model.voz
        vozTextLabel.text = model.vozText
        fitLabel.text = model.fit
        fitTextLabel.text = model.fitText
        sovLabel.text = model.sov
        sovTextLabel.text = model.sovText
        predLabel.text = model.pred
        predTextLabel.text = model.predText
        setColorForName(name: name)
    }
    
    private func setColorForName(name: String) {
        let colorMapping: [UIColor: Set<String>] = [
            .systemRed: [
                "Агроника Гранд", "Арбалет®", "Бастер®", "Берилл®", "Бетаниум®", "Бетаниум® 22", "Гарнизон®", "Гербикс",
                "Глифор®", "Глифор® Форте", "Гран-при", "Дентайр®", "Канон", "Клерк", "Маркос®", "Мегалит®", "Монолит®",
                "Октапон Экстра", "Олимп", "Рапира®", "Рефери", "Сапфир®", "Тайгер", "Тайгер 100", "Тристар®", "Фирман",
                "Цицерон®", "Челленджер®"
            ],
            .purple: [
                "Азоксит®", "Армадекс®", "Бульдог®", "Гранберг®", "Гранберг® Про", "Курсор", "Кэнсел®", "Ципрос", "Эпоксин®"
            ],
            .systemBlue: [
                "Аккорд®", "Восторг", "Дитокс®", "Калаш®", "Лассо®", "Норил"
            ],
            .systemGreen: [
                "АгроМинерал® Зерновые", "АгроМинерал® Олеистые", "АгроМинерал® Стручковые и Бобовые", "Грефф®", "Лип"
            ],
            .orange: [
                "Реголон", "Ректон"
            ],
            .systemPurple: [
                "Виталон", "Грандсил®", "Грандсил® Ультра", "Грифон®", "Пионер", "Сабля", "Стрит®"
            ]
        ]
        
        for (color, names) in colorMapping {
            if names.contains(name) {
                let labels = [
                    upaLabel, normaLabel, obraLabel, formLabel, deistLabel,
                    preLabel, mehLabel, skoLabel, periLabel, spekLabel,
                    vozLabel, fitLabel, sovLabel, predLabel
                ]
                labels.forEach { $0.textColor = color }
                break
            }
        }
    }

}
