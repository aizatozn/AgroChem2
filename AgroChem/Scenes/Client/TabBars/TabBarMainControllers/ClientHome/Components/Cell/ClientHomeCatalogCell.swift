//
//  ClientHomeCatalogCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/3/24.
//

import Foundation
import UIKit

final class ClientHomeCatalogCell: BaseCVCell {

    private let catalogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(red: 0/255, green: 153/255, blue: 51/255, alpha: 1.0)
        return imageView
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .regular)
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
        contentView.addSubview(catalogImageView)
        contentView.addSubview(textLabel)
    }

    private func onSetupConstraints() {

        catalogImageView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(catalogImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }

    }

    func configure(symbolName: String, text: String) {
        catalogImageView.image = UIImage(systemName: symbolName)
        textLabel.text = text
    }
}
