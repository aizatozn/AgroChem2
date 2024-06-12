//
//  ClientProfilePresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientProfilePresentable: BaseView {
    
    let userDef = UserDefaultsServiceImpl()
    
    let userEmailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.black // Заменил цвет текста на черный для лучшей видимости на белом фоне
        label.textAlignment = .center
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 104/255, blue: 56/255, alpha: 1.0) // Используем цвет #006838
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: -1, height: 1)
        button.layer.shadowOpacity = 0.3
        return button
    }()

    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profile") // Заменил изображение на фото с именем "profile"
        return imageView
    }()
    
    override func onConfigureView() {
        super.onConfigureView()
        backgroundColor = .white
        userEmailLabel.text = userDef.getString(.userEmail) ?? ""
    }
    
    override func onAddSubviews() {
        addSubviews(avatarImageView, userEmailLabel, nextButton)
    }
    
    override func onSetupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        userEmailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(avatarImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}

