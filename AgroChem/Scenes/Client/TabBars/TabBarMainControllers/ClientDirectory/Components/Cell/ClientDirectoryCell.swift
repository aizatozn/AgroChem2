//
//  ClientDirectoryCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 12/2/24.
//

import Foundation
import UIKit

final class ClientDirectoryCell: BaseCVCell {

    private let symbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(red: 0/255, green: 153/255, blue: 51/255, alpha: 1.0)
        return imageView
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
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
        contentView.addSubview(symbolImageView)
        contentView.addSubview(textLabel)
    }

    private func onSetupConstraints() {

        symbolImageView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

    }

    func configure(symbolName: String, text: String) {
        symbolImageView.image = UIImage(named: symbolName)
        textLabel.text = text
    }
}
