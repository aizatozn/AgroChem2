//
//  ClientDirectoryDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/4/24.
//

import UIKit
import SnapKit

final class ClientSecondDirectoryDetailsPresentable: BaseView, UISearchBarDelegate {

    var deistDirectories: [ClientSecondDirectoryModel] = [] {
        didSet {
            filteredDirectories1 = deistDirectories
            directoryCollectionView.reloadData()
//            print(directories.count)
        }
    }

    private let directoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 20, right: 0)
        return collectionView
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Поиск действующих веществ"
        return searchBar
    }()

    private var filteredDirectories1: [ClientSecondDirectoryModel] = []

    override func onConfigureView() {
        backgroundColor = .white
        directoryCollectionView.delegate = self
        directoryCollectionView.dataSource = self

        searchBar.backgroundImage = UIImage()
    }

    override func onAddSubviews() {
        addSubviews(directoryCollectionView, searchBar)
        directoryCollectionView.register(ClientSecondDirectoryDetailsCell.self,
                                         forCellWithReuseIdentifier: "CellIdentifier")
    }

    override func onSetupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        directoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    // MARK: - UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredDirectories1 = deistDirectories
        } else {
            filteredDirectories1 = deistDirectories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        directoryCollectionView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ClientSecondDirectoryDetailsPresentable: UICollectionViewDelegate,
                                             UICollectionViewDataSource,
                                             UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        filteredDirectories1.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier",
                                                            for: indexPath) as? ClientSecondDirectoryDetailsCell else {
            fatalError("Unable to dequeue ClientThirdDirectoryDetailsCell")
        }
        cell.configure(model: filteredDirectories1[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      let model = filteredDirectories1[indexPath.item]

      let expectedWidth = collectionView.frame.width - 30

      let cell = ClientSecondDirectoryDetailsCell(frame: .zero)
      cell.configure(model: model)

      cell.layoutIfNeeded()
        let size = cell.systemLayoutSizeFitting(
            CGSize(width: expectedWidth,
                   height: CGFloat.greatestFiniteMagnitude), withHorizontalFittingPriority: .required,
                        verticalFittingPriority: .fittingSizeLevel)

        let height = size.height + 10

      return CGSize(width: expectedWidth, height: height)
    }
}
