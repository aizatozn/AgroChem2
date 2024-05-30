//
//  DirectoryDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/5/24.
//

import UIKit
import SnapKit

final class DirectoryDetailsPresentable: BaseView {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    let subNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let photoImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    let name1Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    let subName1Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name2Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    let subName2Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name3Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    let subName3Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name4Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    let subName4Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name5Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    let subName5Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name6Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    let subName6Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name7Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    let subName7Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name8Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    let subName8Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    let name9Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    let subName9Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    override func onConfigureView() {
        backgroundColor = .white
    }

    override func onAddSubviews() {
        addSubviews(nameLabel, subNameLabel, photoImageView, name1Label, 
                    subName1Label, name2Label, subName2Label, name3Label,
                    subName3Label, name4Label, subName4Label, name5Label,
                    subName5Label, name6Label, subName6Label, name7Label,
                    subName7Label, name8Label, subName8Label, name9Label, subName9Label)
    }

    // swiftlint:disable function_body_length
    override func onSetupConstraints() {

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(10)
        }

        subNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }

        photoImageView.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subNameLabel.snp.bottom).offset(20)
            make.height.equalTo(250)
        }

        name1Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
        }

        subName1Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name1Label.snp.bottom).offset(10)
        }

        name2Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName1Label.snp.bottom).offset(20)
        }

        subName2Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name2Label.snp.bottom).offset(10)
        }

        name3Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName2Label.snp.bottom).offset(20)
        }

        subName3Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name3Label.snp.bottom).offset(10)
        }

        name4Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName3Label.snp.bottom).offset(20)
        }

        subName4Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name4Label.snp.bottom).offset(10)
        }

        name5Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName4Label.snp.bottom).offset(20)
        }

        subName5Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name5Label.snp.bottom).offset(10)
        }

        name6Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName5Label.snp.bottom).offset(20)
        }

        subName6Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name6Label.snp.bottom).offset(10)
        }

        name7Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName6Label.snp.bottom).offset(20)
        }

        subName7Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name7Label.snp.bottom).offset(10)
        }

        name8Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName7Label.snp.bottom).offset(20)
        }

        subName8Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name8Label.snp.bottom).offset(10)
        }

        name9Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(subName8Label.snp.bottom).offset(20)
        }

        subName9Label.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(name9Label.snp.bottom).offset(10)
        }
    } // swiftlint:enable function_body_length
}
