//
//  ClientSystemDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import SnapKit

final class ClientSystemDetailsPresentable: BaseView {

    private let systemDescription: UILabel = {
        let label = UILabel()
        label.text = "Комплексное решение для защиты гороха в течение всего периода роста"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 160
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    var data: [SystemCategories] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func onConfigureView() {
        backgroundColor = .white

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.frame = view.bounds
        UIView.setAnimationsEnabled(false)
    }

    override func onAddSubviews() {
        addSubviews(systemDescription, tableView)
    }

    override func onSetupConstraints() {

        systemDescription.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(systemDescription.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ClientSystemDetailsPresentable: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = data[section]
        if currentSection.isOpened {
            return currentSection.categoryDetails.count + 1 // 1 for category cell
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = .clear
        if indexPath.row == 0 {
            let systemCategoryIndex = indexPath.section
            let cellModel = data[systemCategoryIndex].systemCategory
            let cellInstance: ClientSystemDetailsCell = tableView.dequeue(for: indexPath)
            cellInstance.configure(model: cellModel)
            cell = cellInstance
        } else {
            let medicineIndex = indexPath.row - 1 // Adjust index to match array index
            let medicineModel = data[indexPath.section].categoryDetails[medicineIndex]
            let cellInstance: ClientSubSystemDetailsCell = tableView.dequeue(for: indexPath)
            cellInstance.configure(model: medicineModel)
            cell = cellInstance
            cell.backgroundColor = .white
        }
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            data[indexPath.section].isOpened = !data[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .automatic) // Animate cell expansion/collapse
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        }
        return UITableView.automaticDimension
    }

}
