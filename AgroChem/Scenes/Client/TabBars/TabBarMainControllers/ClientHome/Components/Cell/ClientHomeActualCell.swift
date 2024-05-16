//
//  ClientHomeActualCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/3/24.
//

import Foundation
import UIKit

final class ClientHomeActualCell: BaseCVCell {

    private let imageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func onCreate() {
        layer.cornerRadius = 5
        layer.masksToBounds = true

        onAddSubviews()
        onSetupConstraints()
    }

    private func onAddSubviews() {
        addSubview(imageImageView)
    }

    private func onSetupConstraints() {

        imageImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }

    func configure(image: String) {
        imageImageView.image = UIImage(named: image)
    }
}
