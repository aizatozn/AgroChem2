//
//  ClientCatalogPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit
import Combine

final class ClientCatalogPresentable: BaseView, UISearchBarDelegate {

    var selectedMedicine = CurrentValueSubject<ClientCatalogModel?, Never>(nil)

    private var medicines: [ClientCatalogModel] = []

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        searchBar.backgroundImage = UIImage()
        return table
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()

    private var filteredMedicines: [ClientCatalogModel] = []

    override func onConfigureView() {
        super.onConfigureView()
        backgroundColor = .white

        // Load data from plist file
        loadMedicinesFromPlist()

        filteredMedicines = medicines
        tableView.reloadData()
    }
    
    private let urls: [String: URL] = [
        "Агроника Гранд": URL(string: "https://kccc.ru/katalog/gerbicidy/agronika-grand")!,
        "Арбалет®": URL(string: "https://kccc.ru/katalog/gerbicidy/arbalet")!,
        "Бастер®": URL(string: "https://kccc.ru/katalog/gerbicidy/baster")!
    ]

    private func loadMedicinesFromPlist() {
        if let path = Bundle.main.path(forResource: "Medicines", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path) {
            do {
                let array = try PropertyListSerialization.propertyList(from: data, format: nil) as? [[String: Any]]
                medicines = array?.compactMap { dictionary in
                    guard let image = dictionary["image"] as? String,
                          let name = dictionary["name"] as? String,
                          let subName = dictionary["subName"] as? String,
                          let description = dictionary["description"] as? String else {
                        return nil
                    }
                    return ClientCatalogModel(image: image, name: name, subName: subName, description: description)
                } ?? []
            } catch {
                print("Error reading plist: \(error)")
            }
        }
    }

    override func onAddSubviews() {
        addSubview(searchBar)
        addSubview(tableView)
        tableView.register(ClientCatalogCell.self, forCellReuseIdentifier: "CellIdentifier")
    }

    override func onSetupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }

    // MARK: - UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredMedicines = medicines
        } else {
            filteredMedicines = medicines.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ClientCatalogPresentable: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredMedicines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier",
                                                       for: indexPath) as? ClientCatalogCell else {
            fatalError("Unable to dequeue ClientCatalogCell")
        }
        cell.configure(model: filteredMedicines[indexPath.section])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let medicine = filteredMedicines[indexPath.section]
        guard let url = urls[medicine.name] else {
            print("URL not found for \(medicine.name)")
            return
        }
        UIApplication.shared.open(url)
    }
}
